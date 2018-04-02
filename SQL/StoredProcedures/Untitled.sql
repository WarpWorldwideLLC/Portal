USE WarpAdmin2017;

	SELECT GROUP_CONCAT(JSON_OBJECT(
                     'Command', 'GetCart', 
                     'CommandResults', 'SUCCESS', 
                     'CartID', sc.ID,
                     'MemberNumber', sc.EntityID,
                     'MemberName', mn.EntityName, 
                     'SolutionID', sc.SolutionID,
                     'SolutionName', s.SolutionName, 
                     'SolutionCode', s.SolutionCode, 
                     'SolutionCost', s.SolutionCost,
                     'ProductID', p.ID, 
                     'ProdctName', p.ProductName, 
                     'ProductCode', p.ProductCode
				))AS CommandResult
	FROM ShoppingCart sc
	  LEFT JOIN EntityName mn
		ON mn.ID = sc.EntityID
		  AND mn.EntityNameTypeID = 2
	  LEFT JOIN Solution s
		ON s.ID = sc.SolutionID
	  LEFT JOIN SolutionProduct sp
		ON s.SolutionCode = sp.SolutionCode
	  LEFT JOIN Product p
		ON sp.ProductCode = p.ProductCode       
        
		;
        
        
        
        
        
        {"CartID": 5, "Command": "GetCart", "ProductID": 5, "MemberName": "JohnnyWarp", "ProdctName": "STEM - SCIENCE HUB", "SolutionID": 1, "ProductCode": "PILR-005", "MemberNumber": 2, "SolutionCode": "WARP-STEM-001", "SolutionCost": 249.0000, "SolutionName": "STEM Science Hub", "CommandResults": "SUCCESS"},
        {"CartID": 7, "Command": "GetCart", "ProductID": 5, "MemberName": "JohnnyWarp", "ProdctName": "STEM - SCIENCE HUB", "SolutionID": 1, "ProductCode": "PILR-005", "MemberNumber": 2, "SolutionCode": "WARP-STEM-001", "SolutionCost": 249.0000, "SolutionName": "STEM Science Hub", "CommandResults": "SUCCESS"},{"CartID": 8, "Command": "GetCart", "ProductID": 5, "MemberName": "JohnnyWarp", "ProdctName": "STEM - SCIENCE HUB", "SolutionID": 1, "ProductCode": "PILR-005", "MemberNumber": 2, "SolutionCode": "WARP-STEM-001", "SolutionCost": 249.0000, "SolutionName": "STEM Science Hub", "CommandResults": "SUCCESS"},{"CartID": 9, "Command": "GetCart", "ProductID": 5, "MemberName": "JohnnyWarp", "ProdctName": "STEM - SCIENCE HUB", "SolutionID": 1, "ProductCode": "PILR-005", "MemberNumber": 2, "SolutionCode": "WARP-STEM-001", "SolutionCost": 249.0000, "SolutionName": "STEM Science Hub", "CommandResults": "SUCCESS"},{"CartID": 10, "Command": "GetCart", "ProductID": 5, "MemberName": "JohnnyWarp", "ProdctName": "STEM - SCIENCE HUB", "SolutionID": 1, "ProductCode": "PILR-005", "MemberNumber": 2, "SolutionCode": "WARP-STEM-001", "SolutionCost": 249.0000, "SolutionName": "STEM Science Hub", "CommandResults": "SUCCESS"},{"CartID": 6, "Command": "GetCart", "ProductID": 9, "MemberName": "JohnnyWarp", "ProdctName": "STEM - TECHNOLOGY HUB", "SolutionID": 3, "ProductCode": "PILR-009", "MemberNumber": 2, "SolutionCode": "WARP-STEM-003", "SolutionCost": 199.0000, "SolutionName": "STEM Technology Hub", "CommandResults": "SUCCESS"}
        
        
        
        
        
        
        