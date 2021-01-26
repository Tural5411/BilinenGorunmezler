namespace bilgorsite.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class tbl_bookCategory
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tbl_bookCategory()
        {
            tbl_book = new HashSet<tbl_book>();
        }

        [Key]
        public int BookCategoryId { get; set; }

        [StringLength(70)]
        public string Name { get; set; }

        [StringLength(10)]
        public string Description { get; set; }

        public int? PhotoId { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbl_book> tbl_book { get; set; }

        public virtual tbl_photo tbl_photo { get; set; }
    }
}
