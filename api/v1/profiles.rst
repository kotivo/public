
Profiles
########################################

.. http:get:: /controllers/(int:controller_id)/profiles/(int:profile_id)

	Retrieves all the profiles registered to this controller - can target a specific profile_id, gets all if module_id is not set

	Here is a list of parameters for the request body:

	:>json int controller_id: Controller id number
	:>json int profile_id: Profile id number

	Example response:

	.. code-block:: json

		{
  			"success": true,
  			"data": [
				{
      				"id": 1,
      				"label": "poissa toimistolta (arki)",
	      			"active": false,
    	  			"enabled": true,
      				"period": {
        				"time": {
          					"begin": "17:00:00+02:00",
          					"end": "09:00:00+02:00"
						}
					},
      				"weekdays": [
        				1,
        				2,
        				3,
	        			4,
    	    			5
      				],
      				"metadata": []
      			},
				{
      				"id": 2,
      				"label": "poissa toimistolta (vklp)",
      				"active": false,
	      			"enabled": true,
    	  			"period": {
        				"time": {
          					"begin": "00:00:00+03:00",
          					"end": "00:00:00+03:00"
						}
					},
      				"weekdays": [
        				6,
        				7
	      			],
    	  			"metadata": []
				}
			]
		}

.. http:put:: /controllers/(int:controller_id)/profiles/away

	Writes values for this controllers away profile - can target a specific controller_id

	Here is a list of parameters for the request body:

	:<json boolean away: Whether this profile is active or not
	:<json ISO-8601 begin: When this profile is active
	:<json ISO-8601 end: When this profile is deactivated

	Example request body:

	.. code-block:: json

		{
			"away": true,
			"begin": "15:00:00+02:00",
			"end": "15:30:00+02:00"
		}