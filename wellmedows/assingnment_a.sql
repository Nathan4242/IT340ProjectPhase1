SELECT Employee_Name, Tech_ID
FROM technician
WHERE (SELECT Tech_ID FROM canfix WHERE make="Honda"); 
