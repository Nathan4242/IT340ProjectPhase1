INSERT INTO Requistions(
						Requisition_Number, Requisitioner, Ward_Name, 
						Ward_Number, Item_Number, Item_Name, 
                        Item_description, Drug_Number, Administration_Method, 
                        Qty_Required, Price_Per_Unit, Supplier_Number
                       )
VALUES(
	   "2286", "Warren, Jacob", "E", 
       "12", "1064", "Mop Bucket"
	  );
UPDATE Requisions SET Total_Price = (Qty_Required * Price_Per_Unit) WHERE Requisition_Number >= 0;