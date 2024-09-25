
SELECT P.Nombre AS Paciente, D.Nombre AS Doctor, M.NombreComercial AS Medicamento, PM.Cantidad, PM.Dosis, PR.FechaPrescripcion
FROM Prescripciones PR
INNER JOIN Pacientes P ON PR.IdPaciente = P.IdPaciente
INNER JOIN Doctores D ON PR.IdDoctor = D.IdDoctor
INNER JOIN PrescripcionMedicamento PM ON PR.IdPrescripcion = PM.IdPrescripcion
INNER JOIN Medicamentos M ON PM.IdMedicamento = M.IdMedicamento
WHERE P.IdPaciente = 1;


SELECT P.nombre AS Paciente, PR.FechaPrescripcion, D.Nombre AS Doctor
FROM Pacientes P
LEFT JOIN Prescripciones PR ON P.IdPaciente = PR.IdPaciente
LEFT JOIN Doctores D ON PR.IdDoctor = D.IdDoctor;


SELECT NombreComercial, 
    CASE 
        WHEN Precio > 6000 THEN 'Caro'
        ELSE 'Barato'
    END AS CategoriaPrecio
FROM Medicamentos;


SELECT Nombre AS Nombre, 'Paciente' AS Tipo FROM Pacientes
UNION
SELECT Nombre AS Nombre, 'Doctor' AS Tipo FROM Doctores;
