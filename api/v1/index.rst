
.. toctree::
   :maxdepth: 2
   :caption: Contents:

   accounts
   test


Description
########################################

Kotivo API v1 is a HTTP JSON API.

.. note::

	All request urls must end with slash (``/``), or otherwise a redirection will be returned with an url containing the slash.

Responses
****************************************

All responses follow the same structure.

On success:

.. code-block:: json

	{
		"success": true,
		"data": "what ever should be returned"
	}

On failure (notice that ``data`` is not present):

.. code-block:: json

	{
		"success": false,
		"msg": "message about the error"
	}

Also HTTP status code is set to 200 on success and other value on failure. Most common cases are:

* 400 Required value missing
* 403 Authentication required
* 404 Does not exists, invalid url etc
* 405 API request does not support used method. For example ``/weather/localities/`` which supports only GET.
* 409 Trying to create something that already exists

