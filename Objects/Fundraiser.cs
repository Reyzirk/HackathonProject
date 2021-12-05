using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Finexus_Hackathon.Objects
{
    public class Fundraiser
    {
        private String fundraisingID;
        private String title;
        private String desc;
        private String category;
        private double amtRaised;
        private String coverPhotoFilePath;

        public string Title { get => title; set => title = value; }
        public string Desc { get => desc; set => desc = value; }
        public string Category { get => category; set => category = value; }
        public double AmtRaised { get => amtRaised; set => amtRaised = value; }
        public string CoverPhotoFilePath { get => coverPhotoFilePath; set => coverPhotoFilePath = value; }
        public string FundraisingID { get => fundraisingID; set => fundraisingID = value; }
    }
}