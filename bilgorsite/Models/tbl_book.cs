namespace bilgorsite.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class tbl_book
    {
        [Key]
        public int BookId { get; set; }

        [StringLength(250)]
        public string Name { get; set; }

        public string Context { get; set; }

        public int? Page { get; set; }

        public int? WriterId { get; set; }

        [StringLength(500)]
        public string Filename { get; set; }

        [StringLength(1500)]
        public string Fileurl { get; set; }

        public int? BookCategoryId { get; set; }

        public int? PhotoId { get; set; }

        public virtual tbl_bookCategory tbl_bookCategory { get; set; }

        public virtual tbl_photo tbl_photo { get; set; }

        public virtual tbl_Writer tbl_Writer { get; set; }
    }
}
