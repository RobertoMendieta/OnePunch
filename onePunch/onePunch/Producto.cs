//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace onePunch
{
    using System;
    using System.Collections.Generic;
    
    public partial class Producto
    {
        public int productoID { get; set; }
        public Nullable<int> existencias { get; set; }
        public string descripcion { get; set; }
        public Nullable<bool> image { get; set; }
        public string nombrePr { get; set; }
        public Nullable<int> categoriaID { get; set; }
    
        public virtual Categoria Categoria { get; set; }
    }
}