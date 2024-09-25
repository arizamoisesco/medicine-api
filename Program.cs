using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using MedicamentosAPI.Data;

var builder = WebApplication.CreateBuilder(args);

//Config for add secrets
builder.Configuration
    .AddJsonFile("appsettings.json", optional: true, reloadOnChange: true)
    .AddEnvironmentVariables()
    .AddUserSecrets<Program>();


// Use secrets
var connectionString = builder.Configuration.GetConnectionString("DefaultConnection");
var dbPassword = builder.Configuration["DBPassword"];
Console.WriteLine($"ConnectionString: {connectionString}");

connectionString = connectionString.Replace("password=", $"password={dbPassword}");

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddDbContext<MedicamentosContext>(options =>{
    options.UseMySql(connectionString,
            new MySqlServerVersion(new Version(8, 0, 21)));
});

var app = builder.Build();


// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}


app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
