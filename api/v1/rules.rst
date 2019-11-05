Rules
########################################

.. http:get:: /controllers/(int:controller_id)/modules/(int:device_id)/rules/(int:profile_id)

	Gets all the rules for certain device_id and profile_id - gets all if profile_id is not given

	:>json string id: Name of the rule - int if self made rule
	:>json float temperature: Target temperature for this rule
	:>json array metadata: All the misc. data

	Example response:

	.. code-block:: json

		{
			"success": true,
			"data":[
				{
    		  		"id": "present",
      				"temperature": 23,
	      			"metadata": []
				},
				{
	    	  		"id": "away",
    	  			"temperature": 15,
      				"metadata": []
				},
				{
	    	  		"id": 2,
    	  			"temperature": 15,
    	  			"metadata": []
				},
				{
	    		  	"id": 1,
   		 		  	"temperature": 15,
      				"metadata": []
				}
			]
		}
