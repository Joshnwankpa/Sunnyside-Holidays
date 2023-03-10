# Sunnyside-Holidays
Overview of the project;

Sunnyside Holidays is a business in the tourism sector with several branches around the UK and they provide touristic packages all over the world including flights & accommodations and optional car renting. 
As the business expanded the management team decided that they will need a central database where each branch can connect and proceed with the bookings for the customers. They would like a design for a centralised database (single location relational DB)  that allows web interface access for the employees. The company has multiple roles for employees, each with their own responsibilities. 
As in their holiday packages Sunnyside Holiday are offering flights and hotels they should be able to identify, for each customer, what flight they have,  where they will stay and the duration of holiday. Some customers are travelling with family and children and it would be ideal if the company could provide information about what amenities and facilities a hotel has. 
The price can be different per package and is quoted per person, including flight and accommodation (e.g. Package One - 7 Days in Tenerife at Hotel Gold Sun £500/pp; Package Two - 7 Days in Tenerife at Hotel Green Island £750/pp etc ). The package prices are fixed and they cannot be combined with other flights or hotels. They are considering adding in the future discounts for different packages but this is not a priority at the moment although it will be a nice feature to have.  
Sunnyside Holidays do not store information about accompanied travellers (e.g. name, address dob etc -  although this information would be very useful for them) but they are recording the number of travelling adults and/or children to be able to calculate package price.  
One of the features offered by the Sunnyside Holidays is that a customer can pay for a holiday in one or more instalments hence, it is important for the business to be able to track the payment status. The payment process is handled through 3rd party application, so no credit/debit card details are stored but the status (e.g. “Paid/Unpaid”; “The customer should pay £1000 and so far paid “250“ etc.). The company should be able to track the number of instalments (if any) and the amount paid per instalment. 
The business takes security very seriously and they would like only authorised personnel to access payments (e.g. as all office employees might have access to the database for bookings but only the accountants and managers should have access to the payments history).

Things I and my team members would have handled better
- We would have created a country table which would hold all the countries that would be needed throughout the database.
- More Indexes could have been added to tables such as the Booking table and Customer table, reason being in a few years the company may expand exponentially. Adding indexes would make accessing that table easier.

NB: This was a group project which I managed and contributed to, it was done over a period of 12 weeks.


