using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MVC_Cultuurhuis.Services;
using MVC_Cultuurhuis.Models;

namespace MVC_Cultuurhuis.Controllers
{
    public class HomeController : Controller
    {
        private CultuurService db = new CultuurService();
        public ActionResult Index(int? gekozenGenre = null)
        {
            if (Session.Keys.Count != 0)
                ViewBag.mandjeTonen = true;
            else
                ViewBag.mandjeTonen = false;

            return View(gekozenGenre);
        }

        public PartialViewResult GenreLijst(int? gekozenGenre)
        {
            ViewBag.GekozenGenre = gekozenGenre;
            return PartialView(db.GetAllGenres());
        }

        public PartialViewResult GetVoorstellingenVanGenre(int? gekozenGenre)
        {
            var voorstellingen = db.GetAlleVoorstellingenVanGenre(gekozenGenre);
            return PartialView(voorstellingen);
        }

        public ActionResult Reserveren(int id)
        {
            var gekozenVoorstelling = db.GetVoorstelling(id);
            return View(gekozenVoorstelling);
        }

        [HttpPost]
        public ActionResult Reserveer(int id)
        {
            uint aantalPlaatsen = uint.Parse(Request["aantalPlaatsen"]);
            var voorstellingInfo = db.GetVoorstelling(id);

            if (aantalPlaatsen > voorstellingInfo.VrijePlaatsen)
            {
                return RedirectToAction("Reserveer", "Home", new { id = id });
            }

            Session[id.ToString()] = aantalPlaatsen;

            return RedirectToAction("Mandje", "Home");
        }

        public ActionResult Mandje()
        {
            return View();
        }

        public PartialViewResult MandjeItemsLijst()
        {
            string[] formKeys = Request.Form.AllKeys;
            if (formKeys != null)
            {
                foreach (var item in formKeys)
                {
                    if (Session[item] != null) Session.Remove(item);
                }
            }

            decimal teBetalen = 0;
            var mandjeItems = new List<MandjeItem>();

            foreach (string nummer in Session)
            {
                int voorstellingsnummer;
                if (int.TryParse(nummer, out voorstellingsnummer))
                {
                    var voorstelling = db.GetVoorstelling(voorstellingsnummer);
                    if (voorstelling != null)
                    {
                        var mandjeItem = new MandjeItem(voorstellingsnummer, voorstelling.Titel, voorstelling.Uitvoerders, voorstelling.Datum, voorstelling.Prijs, Convert.ToInt16(Session[nummer]));
                        teBetalen += (mandjeItem.Plaatsen * mandjeItem.Prijs);
                        mandjeItems.Add(mandjeItem);
                    }
                }
            }
            ViewBag.teBetalen = teBetalen;
            return PartialView(mandjeItems);
        }

        [HttpPost]
        public ActionResult Verwijderen()
        {
            foreach (var item in Request.Form.AllKeys)
            {
                if (Session[item] != null)
                    Session.Remove(item);
            }
            return RedirectToAction("Mandje", "Home");
        }

        public ActionResult Bevestiging()
        {
            if (Request["zoek"] != null)
            {
                var naam = Request["naam"];
                var password = Request["password"];
                var klant = db.GetKlant(naam, password);

                if (klant != null)
                    Session["klant"] = klant;
                else
                    ViewBag.errorMessage = "Verkeerde gebruikersnaam of wachtwoord";
                return View();
            }

            if (Request["nieuw"] != null)
            {
                return RedirectToAction("Nieuw", "Home");
            }

            if (Request["bevestig"] != null)
            {
                var klant = (Klant)Session["klant"];
                Session.Remove("klant");

                var gelukteReservaties = new List<MandjeItem>();
                var mislukteReservaties = new List<MandjeItem>();

                foreach (string nummer in Session)
                {
                    var nieuweReservatie = new Reservatie();
                    nieuweReservatie.VoorstellingsNr = int.Parse(nummer);
                    nieuweReservatie.Plaatsen = Convert.ToInt16(Session[nummer]);
                    nieuweReservatie.KlantNr = klant.KlantNr;

                    var voorstelling = db.GetVoorstelling(nieuweReservatie.VoorstellingsNr);
                    if (voorstelling.VrijePlaatsen >= nieuweReservatie.Plaatsen)
                    {
                        db.BewaarReservatie(nieuweReservatie);

                        gelukteReservaties.Add(new MandjeItem(voorstelling.VoorstellingsNr, voorstelling.Titel, voorstelling.Uitvoerders, voorstelling.Datum, voorstelling.Prijs, nieuweReservatie.Plaatsen));
                    }
                    else
                    {
                        mislukteReservaties.Add(new MandjeItem(voorstelling.VoorstellingsNr, voorstelling.Titel, voorstelling.Uitvoerders, voorstelling.Datum, voorstelling.Prijs, nieuweReservatie.Plaatsen));
                    }
                }
                Session.RemoveAll();
                Session["gelukt"] = gelukteReservaties;
                Session["mislukt"] = mislukteReservaties;

                return RedirectToAction("Overzicht", "Home");
            }

            return View();
        }

        public ActionResult Nieuw()
        {
            var nieuwViewModel = new NieuweKlantViewModel();
            return View(nieuwViewModel);
        }

        [HttpPost]
        public ActionResult Nieuw(NieuweKlantViewModel form)
        {
            if (this.ModelState.IsValid)
            {
                Klant nieuweKlant = new Klant();
                nieuweKlant.Voornaam = form.Voornaam;
                nieuweKlant.Familienaam = form.Familienaam;
                nieuweKlant.Straat = form.Straat;
                nieuweKlant.HuisNr = form.Huisnr;
                nieuweKlant.Postcode = form.Postcode;
                nieuweKlant.Gemeente = form.Gemeente;
                nieuweKlant.GebruikersNaam = form.Gebruikersnaam;
                nieuweKlant.Paswoord = form.Paswoord;

                Session["klant"] = nieuweKlant;

                db.VoegKlantToe(nieuweKlant);

                return RedirectToAction("Bevestiging", "Home");
            }
            else
                return View(form);
        }

        public ActionResult Overzicht()
        {
            var gelukteReservaties = (List<MandjeItem>)Session["gelukt"];
            var mislukteReservaties = (List<MandjeItem>)Session["mislukt"];
            ViewBag.gelukt = gelukteReservaties;
            ViewBag.mislukt = mislukteReservaties;
            Session.Clear();
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}