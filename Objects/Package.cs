using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Finexus_Hackathon.Objects
{
    public class Package
    {
        private String packageID;
        private String title;
        private String desc;
        private double minAmt;
        private string filepath;
        private string fundraisingID;

        public string Title { get => title; set => title = value; }
        public string Desc { get => desc; set => desc = value; }
        public double MinAmt { get => minAmt; set => minAmt = value; }
        public string Filepath { get => filepath; set => filepath = value; }
        public string FundraisingID { get => fundraisingID; set => fundraisingID = value; }
        public string PackageID { get => packageID; set => packageID = value; }
    }
}