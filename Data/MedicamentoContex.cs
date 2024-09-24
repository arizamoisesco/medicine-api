using Microsoft.EntityFrameworkCore;
using MedicamentosAPI.Models;

namespace MedicamentosAPI.Data
{
    public class MedicamentosContext : DbContext
    {
        public MedicamentosContext(DbContextOptions<MedicamentosContext> options) : base(options) { }

        public DbSet<Medicamento> Medicamentos { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Medicamento>().ToTable("Medicamentos");
        }
    }
}
