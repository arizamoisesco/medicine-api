USE recetas_medicas;

INSERT INTO Pacientes (Nombre, FechaNacimiento, Direccion, Telefono, Email) VALUES
('Juan Perez', '1985-03-15', 'Calle 123', '555-1234', 'juan.perez@example.com'),
('Maria Lopez', '1990-07-22', 'Avenida Central 456', '555-5678', 'maria.lopez@example.com'),
('Carlos Sánchez', '1982-11-30', 'Calle 789', '555-8765', 'carlos.sanchez@example.com'),
('Ana Torres', '1995-01-10', 'Carrera 101', '555-4321', 'ana.torres@example.com'),
('Laura Martínez', '1988-03-05', 'Calle 202', '555-1357', 'laura.martinez@example.com');

INSERT INTO Doctores (Nombre, Especialidad, Telefono, Email) VALUES
('Ana Gómez', 'Cardiología', '555-5678', 'ana.gomez@example.com'),
('Luis Fernández', 'Pediatría', '555-6789', 'luis.fernandez@example.com'),
('Silvia Ramírez', 'Dermatología', '555-7890', 'silvia.ramirez@example.com'),
('Jorge Castro', 'Medicina General', '555-8901', 'jorge.castro@example.com'),
('Carolina Ríos', 'Endocrinología', '555-9012', 'carolina.rios@example.com');

INSERT INTO Medicamentos (NombreComercial, NombreGenerico, Concentracion, FormaFarmaceutica, Fabricante, Precio) VALUES
('Ibuprofeno', 'Ibuprofeno', '400 mg', 'Tableta', 'Laboratorio XYZ', 2500.50),
('Paracetamol', 'Paracetamol', '500 mg', 'Tableta', 'Laboratorio ABC', 3250.75),
('Amoxicilina', 'Amoxicilina', '250 mg', 'Cápsula', 'Laboratorio DEF', 5500.00),
('Loratadina', 'Loratadina', '10 mg', 'Tableta', 'Laboratorio GHI', 3500.20),
('Metformina', 'Metformina', '850 mg', 'Tableta', 'Laboratorio JKL', 4500.50);

INSERT INTO Prescripciones (IdPaciente, IdDoctor, FechaPrescripcion, Observaciones) VALUES
(1, 1, '2024-09-01', 'Tomar con alimentos'),
(2, 2, '2024-09-02', 'Revisar alergias antes de usar'),
(3, 3, '2024-09-03', 'Consultar por efectos secundarios'),
(4, 4, '2024-09-04', 'Tomar en ayunas'),
(5, 5, '2024-09-05', 'Revisar niveles de azúcar');

INSERT INTO PrescripcionMedicamento (IdPrescripcion, IdMedicamento, Cantidad, Dosis) VALUES
(1, 1, 30, '1 tableta cada 8 horas'),
(1, 2, 20, '1 tableta cada 12 horas'),
(2, 3, 15, '1 cápsula cada 8 horas'),
(3, 4, 30, '1 tableta diaria'),
(4, 5, 60, '1 tableta cada 12 horas');


