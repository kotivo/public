
Accounts
########################################

Authentication
****************************************

Authentication can be done either using session (browser environments) or using HTTP Basic Auth (scripts etc).

.. http:get:: /accounts/login/

	Simply return current account information or access denied if not logged in.
	Can also be used to check if authentication is ok when using HTTP Basic Auth.

	:>json int id: Account ID
	:>json email username: Username (email)
	:>json string language: ISO 639-1 language code

	Example using curl:

	.. code-block:: bash

		curl -s -u 'user@example.com:password' \
		'https://api.host/api/v1/accounts/login/' | python -m json.tool

	Response:

	.. code-block:: json

		{
			"success": true,
			"data": {
				"id": 1,
				"username": "user@example.com",
				"language": "fi"
			}
		}

.. http:put:: /accounts/login/

	Authenticate account to current session.

	:<json email username: Username (email)
	:<json string password: Password

	Example request body:

	.. code-block:: json

		{
			"username": "user@example.com",
			"password": "password"
		}

	Response is the same as for GET.

.. http:get:: /accounts/logout/

	Logout current session.

Information
****************************************

.. http:get:: /accounts/(int:id)

	Retrieve authenticated account information.

	:>json int id: Account ID
	:>json email email: Email
	:>json string firstname: First name
	:>json string lastname: Last name
	:>json string phone: Phone number
	:>json object address: Address information
	:>json string address.street: Street
	:>json string address.postcode: Postcode
	:>json string address.city: City
	:>json ISO-3166-1 address.country: Country
	:>json string messaging:
		Send messages using:
		
		* disabled
		* email
		* sms

	:>json ISO-8601 last_visit: Date and time of last login
	:>json ISO-8601 registered: Date and time of registration
	:>json array controllers: List of controller IDs registered to this account
	:>json string language: ISO 639-1 language code
	:>json object messages: Count of messages, total and unseen
	:>json int messages.total: Total message count
	:>json int messages.unseen: Unseen message count
	:>json object metadata: Custom metadata

	Example response:

	.. code-block:: json

		{
		  "success": true,
		  "data": {
		    "id": 1,
		    "email": "username@example.com",
		    "firstname": "Sherlock",
		    "lastname": "Holmes",
		    "phone": "+44 20 7224 3688",
		    "address": {
		      "street": "221B Baker Street",
		      "postcode": "WC2N 5DB",
		      "city": "London",
		      "country": "GB"
		    },
		    "messaging": "disabled",
		    "last_visit": "1904-10-22T13:31:51+01:00",
		    "registered": "1881-01-15T12:37:44+01:00",
		    "controllers": [
		      1859,
		      1930
		    ],
		    "language": "en",
		    "messages": {
		      "total": 17,
		      "unseen": 2
		    },
		    "metadata": {
		      "my-personal-stuff": {
		        "anything": "yes"
		      },
		      "system-user-interface": "might be something system related here"
		    }
		  }
		}

Utility
****************************************

.. http:put:: /accounts/invite

	Send email to invite new user for the controller

	Example response:

	.. code-block:: json

		{
		  "success": true,
		  "data": []
		}

.. http:put:: /accounts/password/reset

	Sends email to the corresponding user with the password reset link

	Example response:

	.. code-block:: json

		{
		  "success": true,
		  "data": []
		}

.. http:get:: /accounts/messages/(int:message_id)

	Gets one message from database according to message_id.

	Example response:

	.. code-block:: json

		{
	  		"success": true,
	  		"data": {
	   	 		"id": 156,
	    		"subject": "Kotivo yhteysvika: 666",
	    		"content": "Keskusyksikkösi \"666\" ei ole ollut yhteydessä vuorokauteen. Tarkista keskusyksikkösi internet yhteys.",
	    		"created": "2019-09-25T11:56:01+03:00",
	    		"seen": true,
	    		"metadata": {
	      			"dismissed": true
	    		}
	  		}
		}
