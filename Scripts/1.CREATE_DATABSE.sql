CREATE DATABASE recetas_medicas;

USE recetas_medicas;

CREATE TABLE Pacientes (
    IdPaciente INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    Direccion VARCHAR(255),
    Telefono VARCHAR(15),
    Email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Doctores (
    IdDoctor INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Especialidad VARCHAR(100) NOT NULL,
    Telefono VARCHAR(15),
    Email VARCHAR(100) UNIQUE NOT NULL
);


CREATE TABLE Medicamentos (
    IdMedicamento INT AUTO_INCREMENT PRIMARY KEY,
    NombreComercial VARCHAR(100) NOT NULL,
    NombreGenerico VARCHAR(100) NOT NULL,
    concentracion VARCHAR(50),
    FormaFarmaceutica VARCHAR(50),
    Fabricante VARCHAR(100),
    Precio DECIMAL(10, 2) NOT NULL
);


CREATE TABLE Prescripciones (
    IdPrescripcion INT AUTO_INCREMENT PRIMARY KEY,
    IdPaciente INT NOT NULL,
    IdDoctor INT,
    FechaPrescripcion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Observaciones VARCHAR(255),
    CONSTRAINT fk_paciente FOREIGN KEY (IdPaciente) REFERENCES Pacientes(IdPaciente) ON DELETE CASCADE,
    CONSTRAINT fk_doctor FOREIGN KEY (IdDoctor) REFERENCES Doctores(IdDoctor) ON DELETE SET NULL
);


CREATE TABLE PrescripcionMedicamento (
    IdPrescripcion INT NOT NULL,
    IdMedicamento INT NOT NULL,
    cantidad INT DEFAULT 1,
    dosis VARCHAR(50),
    PRIMARY KEY (IdPrescripcion, IdMedicamento),
    CONSTRAINT fk_prescripcion FOREIGN KEY (IdPrescripcion) REFERENCES Prescripciones(IdPrescripcion) ON DELETE CASCADE,
    CONSTRAINT fk_medicamento FOREIGN KEY (IdMedicamento) REFERENCES Medicamentos(IdMedicamento) ON DELETE CASCADE
);



