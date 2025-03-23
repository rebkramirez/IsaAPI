using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.EntityFrameworkCore;
using ISAControlesAPI.Models; // <- Importante

var builder = WebApplication.CreateBuilder(args);

// Agregar servicios al contenedor.
builder.Services.AddControllers();

// Registrar el DbContext con la cadena de conexión
builder.Services.AddDbContext<IsacontrolesContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("CnnStr")));

// Configurar CORS para permitir llamadas desde el emulador (10.0.2.2)
builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowEmulator", policy =>
    {
        policy.WithOrigins("http://10.0.2.2")
              .AllowAnyHeader()
              .AllowAnyMethod();
    });
});

// Swagger (documentación interactiva de tu API)
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Usar CORS
app.UseCors("AllowEmulator");

// Swagger (solo en desarrollo)
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseAuthorization();

app.MapControllers();

app.Run();

