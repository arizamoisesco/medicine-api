using Microsoft.AspNetCore.Mvc;
using MedicamentosAPI.Models;
using MedicamentosAPI.Data;
using Microsoft.EntityFrameworkCore;

namespace MedicamentosAPI.Controllers;

[Route("api/[controller]")]
[ApiController]
public class MedicamentosController : ControllerBase
{
    private readonly MedicamentosContext _context;

    public MedicamentosController(MedicamentosContext context)
    {
        _context = context;
    }

    // GET: api/Medicamentos
    [HttpGet(Name = "GetMedicines")]
    public async Task<ActionResult> GetAllMedicines()
    {
        var medicines = await _context.Medicamentos.ToListAsync();

        return Ok(medicines);
        //return await _context.Medicamentos.ToListAsync();
    }

    // GET: api/Medicamentos/5
    [HttpGet("{id}")]
    public async Task<ActionResult<Medicamento>> GetMedicamento(int id)
    {
        var medicamento = await _context.Medicamentos.FindAsync(id);

        if (medicamento == null)
        {
            return NotFound();
        }

        return medicamento;
    }

    // POST: api/Medicamentos
    [HttpPost]
    public async Task<ActionResult<Medicamento>> PostMedicamento(Medicamento medicamento)
    {
        _context.Medicamentos.Add(medicamento);
        await _context.SaveChangesAsync();

        return CreatedAtAction(nameof(GetMedicamento), new { id = medicamento.IdMedicamento }, medicamento);
    }

    // PUT: api/Medicamentos/5
    [HttpPut("{id}")]
    public async Task<IActionResult> PutMedicamento(int id, Medicamento medicamento)
    {
        if (id != medicamento.IdMedicamento)
        {
            return BadRequest();
        }

        _context.Entry(medicamento).State = EntityState.Modified;
        await _context.SaveChangesAsync();

        return NoContent();
    }

    // DELETE: api/Medicamentos/5
    [HttpDelete("{id}")]
    public async Task<IActionResult> DeleteMedicamento(int id)
    {
        var medicamento = await _context.Medicamentos.FindAsync(id);

        if (medicamento == null)
        {
            return NotFound();
        }

        _context.Medicamentos.Remove(medicamento);
        await _context.SaveChangesAsync();

        return NoContent();
    }
}
