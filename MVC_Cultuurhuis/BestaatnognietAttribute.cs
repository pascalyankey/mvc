﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MVC_Cultuurhuis
{
    public class BestaatnognietAttribute : ValidationAttribute
    {
        public override bool IsValid(object value)
        {
            if (value == null)
                return true;
            if (!(value is string))
                return false;
            else
            {
                var db = new Services.CultuurService();
                return !db.BestaatKlant((string)value);
            }
        }
    }
}