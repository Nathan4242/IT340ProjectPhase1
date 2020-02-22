USE wellmedows;

INSERT INTO Suppliers(Supplier_Number, Supplier_Name, Supplier_Address, Supplier_Phone, Supplier_Fax)
VALUES(NULL, "Janitors R Us", "1601 Wallace Ave", "683-729-6442", "303-026-1111");
INSERT INTO Suppliers(Supplier_Number, Supplier_Name, Supplier_Address, Supplier_Phone, Supplier_Fax)
VALUES(NULL, "Meds R Us", "1604 Wallace Ave", "682-729-6442", "302-026-1111");

INSERT INTO Supplies(Item_Number, Supplier_Number, Item_Name, Item_Description, Qty_Stock, Price_Per_Unit, Reorder_Level)
VALUES(NULL, (SELECT Supplier_Number FROM Suppliers WHERE Supplier_Name = "Janitors R Us"), "Mop Bucket", "Holds water for mops", 0.0, 2.0);
INSERT INTO Supplies(Item_Number, Supplier_Number, Item_Number, Item_Name, Item_Description, Qty_Stock, Reorder_Level)
VALUES(NULL, (SELECT Supplier_Number FROM Suppliers WHERE Supplier_Name = "Meds R Us"), "Bovine Insulin", "Lowers Blood Sugar", 286.3249, 300.000000);

INSERT INTO Pharmacutical_Supplies(Item_Number, Drug_Number, Drug_Dosage, Administration_Method)
VALUES((SELECT Item_Number FROM Supplies WHERE Item_Number = "Bovine Insulin"), "16", 17.635, "Injection");