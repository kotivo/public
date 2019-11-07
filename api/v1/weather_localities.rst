Weather Localities
########################################
General
****************************************

.. http:get:: /weather/localities/(int: id)

	Gets Outside weather information from fmi database - Gets all the locations if (int: id) is not set

	:>json int id: Weather station id
	:>json string label: Name of the weather station
	:>json string source: Source of the weather station data
	:>json float temperature: Current outside temperature
	:>json DateTime updated: Time of the last known 

	Example response:

	.. code-block:: json

		{
			"id": 101459,
			"label": "Tohmajärvi Kemie",
			"source": "ilmatieteenlaitos",
			"temperature": -9,
			"updated": "2019-11-06T14:50:00+02:00"
		}

	PUT not allowed!