using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MedicamentosAPI.Models
{
    public class Medicamento
{
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public int IdMedicamento { get; set; }
    public required string NombreComercial { get; set; }
    public required string NombreGenerico { get; set; }
    public required string Concentracion { get; set; }
    public required string FormaFarmaceutica { get; set; }
    public required string Fabricante { get; set; }
    public decimal Precio { get; set; }
}

}
