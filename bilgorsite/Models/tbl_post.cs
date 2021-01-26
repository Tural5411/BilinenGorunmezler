namespace bilgorsite.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class tbl_post
    {
        [Key]
        public int PostId { get; set; }

        [StringLength(300)]
        public string Title { get; set; }

        public string Context { get; set; }

        public int? Views { get; set; }

        public bool? Active { get; set; }

        public bool? Accept { get; set; }

        public DateTime? DateTime { get; set; }

        public int? CategoryId { get; set; }

        public Guid? AuthorId { get; set; }

        public int? PhotoId { get; set; }

        public virtual aspnet_Users aspnet_Users { get; set; }

        public virtual tbl_category tbl_category { get; set; }

        public virtual tbl_photo tbl_photo { get; set; }
    }
}
