namespace bilgorsite.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class tbl_video
    {
        [Key]
        public int VideoId { get; set; }

        [StringLength(600)]
        public string VideoURL { get; set; }

        public int? PhotoId { get; set; }

        [StringLength(250)]
        public string Title { get; set; }

        public virtual tbl_photo tbl_photo { get; set; }
    }
}
