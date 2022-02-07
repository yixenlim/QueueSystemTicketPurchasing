function ticket()
    ticketInformationTable = [1,60,60,60;2,70,75,80;3,60,75,70;4,50,50,50;5,70,70,65;6,40,40,40];
    ticketSlotTable = [1,0.2,0.2,1,20;2,0.1,0.3,21,30;3,0.05,0.35,31,35;4,0.15,0.5,36,50;5,0.2,0.7,51,70;6,0.3,1,71,100];
	ticketTypePriceTable = [1,0.3,0.3,1,30,15;2,0.5,0.8,31,80,25;3,0.2,1,81,100,15]; 
	interArrivalTimeTable = [2,0.15,0.15,1,15;3,0.2,0.35,16,35;4,0.25,0.6,36,60;5,0.1,0.7,61,70;6,0.3,1,71,100];
    serviceCounterTimeTable = [6,0.2,0.2,1,20;7,0.25,0.45,21,45;8,0.25,0.7,46,70;9,0.15,0.85,71,85;10,0.15,1,86,100];
    
	%displaying the ticket information
	disp('+----------------------------------------------------------------------------------+');
	disp('|                                Ticket Information                                |');
	disp('+------------+---------------------+-----------------------+-----------------------+');
    disp('| Day / Slot | Total ticket type 1 |  Total ticket type 2  |  Total ticket type 3  |');
    disp('+------------+---------------------+-----------------------+-----------------------+');
	for i=1:6
		fprintf('|     %1.0f      |         %3.0f         |          %3.0f          |          %3.0f          |\n',ticketInformationTable(i,1),ticketInformationTable(i,2),ticketInformationTable(i,3),ticketInformationTable(i,4));
    end 
	disp('+------------+---------------------+-----------------------+-----------------------+');
	fprintf('\n\n');
	
	%displaying the probability of ticket slot per day
	disp('+-----------------------------------------------------------------------+');
	disp('|                            Ticket Slot / Day                          |');
    disp('+-------------------+-------------+-------+--------------+--------------+');
    disp('| Ticket Slot / Day | Probability |  CDF  |  Range (MIN) |  Range (MAX) |');
    disp('+-------------------+-------------+-------+--------------+--------------+');
	for i=1:6
		fprintf('|        %1.0f          |    %4.2f     | %4.2f  |     %3.0f      |      %3.0f     |\n',ticketSlotTable(i,1),ticketSlotTable(i,2),ticketSlotTable(i,3),ticketSlotTable(i,4),ticketSlotTable(i,5));
    end 
	disp('+-------------------+-------------+-------+--------------+--------------+');
	fprintf('\n\n');
	
	%displaying the probability table of ticket type
    disp('+---------------------------------------------------------------------------------+');
	disp('|                                   Ticket Type                                   |');
    disp('+-------------------+-------------+-------+--------------+--------------+---------+');
    disp('| Ticket Slot / Day | Probability |  CDF  |  Range (MIN) |  Range (MAX) |  Price  |');
    disp('+-------------------+-------------+-------+--------------+--------------+---------+');
	for i=1:3
		fprintf('|   Ticket Type %1.0f   |    %4.2f     | %4.2f  |     %3.0f      |      %3.0f     |  %4.2f  |\n',ticketTypePriceTable(i,1),ticketTypePriceTable(i,2),ticketTypePriceTable(i,3),ticketTypePriceTable(i,4),ticketTypePriceTable(i,5),ticketTypePriceTable(i,6));
    end 
    disp('+-------------------+-------------+-------+--------------+--------------+---------+');
	fprintf('\n\n');
	
	%displaying the probability of inter-arrival time
	disp('+-------------------------------------------------------------------+');
	disp('|                            Inter-arrival                          |');
    disp('+---------------+-------------+-------+--------------+--------------+');
    disp('| Inter-arrival | Probability |  CDF  |  Range (MIN) |  Range (MAX) |');
    disp('+---------------+-------------+-------+--------------+--------------+');
	for i=1:5
		fprintf('|       %1.0f       |    %4.2f     | %4.2f  |     %3.0f      |      %3.0f     |\n',interArrivalTimeTable(i,1),interArrivalTimeTable(i,2),interArrivalTimeTable(i,3),interArrivalTimeTable(i,4),interArrivalTimeTable(i,5));
    end 
	disp('+---------------+-------------+-------+--------------+--------------+');
	fprintf('\n\n');
	
	%displaying the probability of service time
	disp('+-------------------------------------------------------------------+');
	disp('|                        Counter service time                       |');
	disp('+---------------+-------------+-------+--------------+--------------+');
	disp('| Service time  | Probability |  CDF  |  Range (MIN) |  Range (MAX) |');
	disp('+---------------+-------------+-------+--------------+--------------+');
	for i=1:5
		fprintf('|      %2.0f       |    %4.2f     | %4.2f  |     %3.0f      |      %3.0f     |\n',serviceCounterTimeTable(i,1),serviceCounterTimeTable(i,2),serviceCounterTimeTable(i,3),serviceCounterTimeTable(i,4),serviceCounterTimeTable(i,5));
	end 
	disp('+---------------+-------------+-------+--------------+--------------+');
	fprintf('\n\n')
	
	%ask for operation counters
	while (1)
        disp('Do you want Counter 1 in operation? ("y" for yes, other input wil be considered as no)');
        C_one = input('Answer: ','s');
        disp('Do you want Counter 2 in operation? ("y" for yes, other input wil be considered as no)');
        C_two = input('Answer: ','s');
        disp('Do you want Counter 3 in operation? ("y" for yes, other input wil be considered as no)');
        C_three = input('Answer: ','s');
        if (C_one == 'y' | C_two == 'y' | C_three == 'y')
            break;
        end
        fprintf('\nError: Please enter at least one answer that is "y".\n\n');
    end
	
	%ask for number of customers
	fprintf('\nHow many customers are there?\n');
	while (1)
		numCust = input('Number: ');
		if (numCust < 1)
			fprintf('\nError: Please enter a valid number of customers.\n');
		else
			break;
		end
	end
	
	%set the number of ticket purchased by each customers
	for i = 1:numCust
        minTicket = 1;
        maxTicket = 10;
        numOfTicket(i) = floor(maxTicket * rand(1,1000) + minTicket);
    end
	
	%ask for choice of random numeber calculation method
	fprintf('\nWhat generators would you like to use for the random numbers (RNs)?\n');
	disp('1. Random numbers generator from FREEMAT');
	disp('2. Mixed linear congruential generator');
	disp('3. Multiplicative linear congruential generator');
	disp('4. Additive linear congruential generator');
	disp('5. Random variate generator: Exponential generator');
	disp('6. Random variate generator: Uniform generator');
	while (1)
		calc_method = input('Choice: ');
		if (calc_method < 1 | calc_method > 6)
			fprintf('\nError: Please choose within the given choice range.\n');
		else
			break;
		end
	end
	fprintf('\n');
	
	%generate random numbers (RNs)
	if (calc_method == 1)
		rnInterArrival = floor(100 * rand(1,numCust) + 1);
        rnServiceTime = floor(100 * rand(1,numCust) + 1);
		rnTicketType = floor(100 * rand(1,numCust) + 1);
		rnTicketSlot = floor(100 * rand(1,numCust) + 1);
	elseif (calc_method >= 2 & calc_method <= 4)
		while(1)
			repeat = 0;
			if (calc_method == 3)
				lcg_c = 0;
			else
				lcg_c = input('Your "c" in the LCG formula: ');
			end
			
			if (calc_method == 4)
				lcg_a = 1;
			else
				lcg_a = input('Your "a" in the LCG formula: ');
			end
			rnInterArrival = lcg(lcg_a,lcg_c,100,numCust);
			rnServiceTime = lcg(lcg_a,lcg_c,100,numCust);
			rnTicketType = lcg(lcg_a,lcg_c,100,numCust);
			rnTicketSlot = lcg(lcg_a,lcg_c,100,numCust);
			
			for i=1:numCust
				if (rnInterArrival(i) <= 0 | rnInterArrival(i) > 100 | rnServiceTime(i) <= 0 | rnServiceTime(i) > 100 | rnTicketType(i) <= 0 | rnTicketType(i) > 100 | rnTicketSlot(i) <= 0 | rnTicketSlot(i) > 100)
					fprintf('\nError: The results are not between 1 and 100, please re-enter the value needed.\n');
					repeat = 1;
					break;
				end
			end
			
			if (repeat == 0)
				break;
			end
		end
	elseif (calc_method == 5)
		while(1)
			repeat = 0;
			while(1)
				disp('Tips: The smaller the lambda the better the result.');
				lam = input('Your "lambda" in the RVG exponential distribution formula: ');
				if (lam <= 0)
					fprintf('\nError: Please enter a "lambda" that is greater than 0 to get positive result.\n');
				else
					break;
				end
			end
			rnInterArrival = RVGexp(lam,numCust);
			rnServiceTime = RVGexp(lam,numCust);
			rnTicketType = RVGexp(lam,numCust);
			rnTicketSlot = RVGexp(lam,numCust);
			
			for i=1:numCust
				if (rnInterArrival(i) <= 0 | rnInterArrival(i) > 100 | rnServiceTime(i) <= 0 | rnServiceTime(i) > 100 | rnTicketType(i) <= 0 | rnTicketType(i) > 100 | rnTicketSlot(i) <= 0 | rnTicketSlot(i) > 100)
					fprintf('\nError: The results are not between 1 and 100, please re-enter the value needed.\n');
					repeat = 1;
					break;
				end
			end
			
			if (repeat == 0)
				break;
			end
		end
	elseif (calc_method == 6)
		rvg_a = 1;
		rvg_b = 100;
		rnInterArrival = RVGuni(rvg_a,rvg_b,numCust);
		rnServiceTime = RVGuni(rvg_a,rvg_b,numCust);
		rnTicketType = RVGuni(rvg_a,rvg_b,numCust);
		rnTicketSlot = RVGuni(rvg_a,rvg_b,numCust);
	end
	
	%searching Inter-arrival of customers based on RNs
	for i=1:numCust
		IA_repeat = 1;
		ST_repeat = 1;
		for j=1:5
			if (rnInterArrival(i) <= interArrivalTimeTable(j,5) & IA_repeat == 1)
				InterArrival(i) = interArrivalTimeTable(j,1);
				IA_repeat = 0;
			end
			if (rnServiceTime(i) <= serviceCounterTimeTable(j,5) & ST_repeat == 1)
				ServiceTime(i) = serviceCounterTimeTable(j,1);
				ST_repeat = 0;
			end
		end
	end
	rnInterArrival(1) = 0;
	InterArrival(1) = 0;
	
	%searching ticket type and amount pto be paid by customers based on RNs
	for i=1:numCust
		TT_repeat = 1;
		for j=1:3
			if (rnTicketType(i) <= ticketTypePriceTable(j,5) & TT_repeat == 1)
				TicketType(i) = ticketTypePriceTable(j,1);
				AmountPaid(i) = ticketTypePriceTable(j,6) * numOfTicket(i);
				TT_repeat = 0;
			end
		end
	end
	
	%searching ticket slot per day based on RNs
	for i=1:numCust
		TS_repeat = 1;
		for j=1:6
			if (rnTicketSlot(i) <= ticketSlotTable(j,5) & TS_repeat == 1)
				TicketSlot(i) = ticketSlotTable(j,1);
				TS_repeat = 0;
			end
		end
	end
	
	%calculating arrival time of customers
	ArrivalTime(1) = 0;
	for i=2:numCust
		ArrivalTime(i) = InterArrival(i) + ArrivalTime(i-1);
	end
	
	%calculating total ticket available for sales
	totalTicket = 0;
	for i=1:6
		for j=2:4
			totalTicket = totalTicket + ticketInformationTable(i,j);
		end
	end
	
	%messages of inital operting counter(s) (Note: 1 = free, 0 = busy)
	FreeCounterOne = 0;
	FreeCounterTwo = 0;
	FreeCounterThree = 0;
	if (C_one == 'y' & C_two == 'y' & C_three == 'y')
		fprintf('\nCounter 1, Counter 2 and Counter 3 are in operation.\n');
		FreeCounterOne = 1;
		FreeCounterTwo = 1;
		FreeCounterThree = 1;
		ActiveCounter = [1,2,3];
		MaxCounter = 3;
	elseif (C_one == 'y' & C_two == 'y')
		fprintf('\nCounter 1 and Counter 2 are in operation.\n');
		FreeCounterOne = 1;
		FreeCounterTwo = 1;
		ActiveCounter = [1,2];
		MaxCounter = 2;
	elseif (C_one == 'y' & C_three == 'y')
		fprintf('\nCounter 1 and Counter 3 are in operation.\n');
		FreeCounterOne = 1;
		FreeCounterThree = 1;
		ActiveCounter = [1,3];
		MaxCounter = 2;
	elseif (C_two == 'y' & C_three == 'y')
		fprintf('\nCounter 2 and Counter 3 are in operation.\n');
		FreeCounterTwo = 1;
		FreeCounterThree = 1;
		ActiveCounter = [2,3];
		MaxCounter = 2;
	elseif (C_one == 'y')
		fprintf('\nCounter 1 is in operation.\n');
		FreeCounterOne = 1;
		ActiveCounter(1) = 1;
		MaxCounter = 1;
	elseif (C_two == 'y')
		fprintf('\nCounter 2 is in operation.\n');
		FreeCounterTwo = 1;
		ActiveCounter(1) = 2;
		MaxCounter = 1;
	elseif (C_three == 'y')
		fprintf('\nCounter 3 is in operation.\n');
		FreeCounterThree = 1;
		ActiveCounter(1) = 3;
		MaxCounter = 1;
	end
	
	CustNo = 1;
	Minute = 0;
	StartServingTime = zeros (1,numCust);
	WaitingMinute = zeros (1,numCust);
	Departure_counter = 1;
	DepartureTime = zeros (1,numCust);
	CanDepart_counter = 1;
	CanDepartList = zeros (1,numCust);
	Service_counter = 1;
	CounterServiceNow = ActiveCounter(1);
	CounterServiceNowArray = zeros(1,numCust);
	AllCustomerFinish = 0;
	AllDepart = 0;
	AllArrive = 0;
	AllServe = 0;
	ticketSold = 0;
	AllticketSoldOut = 0;
	
	%loop to generate messages
	while (1)
		CurrentCustNoArrived = 0;
		SureNoCounterFree = 0;
		
		%departure of customers
		for i=1:CustNo
			Departure_counter = CanDepartList(i);
			if (Departure_counter ~= 0)
				if (DepartureTime(Departure_counter) == Minute)
					AllDepart = AllDepart + 1;
					fprintf('Departure of customer No.%2.0f at minute %2.0f.\n',Departure_counter,Minute);
					
					%free the serving counter (1 = free, 0 = busy)
					if (CounterServiceNowArray(Departure_counter) == 1)
						FreeCounterOne = 1;
					elseif (CounterServiceNowArray(Departure_counter) == 2)
						FreeCounterTwo = 1;
					elseif (CounterServiceNowArray(Departure_counter) == 3)
						FreeCounterThree = 1;
					end
				end
			end
		end
		
		%check whether all customers have left
		if (AllDepart == numCust)
			disp('All customers have left!');
			break;
		end
		
		%arrival of customers
		if((Minute == ArrivalTime(CustNo)) & AllDepart < numCust)
			CurrentCustNoArrived = 1;
			AllArrive = AllArrive + 1;
			fprintf('Arrival of customer No.%2.0f at minute %2.0f.\n',CustNo,Minute);
		end
		
		%serving customer(s)
		if ((Service_counter <= numCust) & (AllDepart < numCust) & (AllServe < numCust))
			while ((Minute == (ArrivalTime(Service_counter) + WaitingMinute(Service_counter))) & SureNoCounterFree == 0 & AllticketSoldOut == 0 & AllServe < numCust)
				%find available counter (1 = free, 0 = busy)
				CounterServiceNow = 0;
				for i=1:MaxCounter
					if (ActiveCounter(i) == 1)
						if (FreeCounterOne == 1)
							CounterServiceNow = 1;
							break;
						end
					elseif (ActiveCounter(i) == 2)
						if (FreeCounterTwo == 1)
							CounterServiceNow = 2;
							break;
						end
					elseif (ActiveCounter(i) == 3)
						if (FreeCounterThree == 1)
							CounterServiceNow = 3;
							break;
						end
					end
				end
				
				%check whether new counter needs to be opened or customer(s) have to wait
				if (CounterServiceNow == 0)
					if (MaxCounter == 1)
						MaxCounter = 2;
						if (ActiveCounter(1) == 1)
							ActiveCounter(2) = 2;
							disp('Counter 2 is now in operation.');
							CounterServiceNow = 2;
						elseif (ActiveCounter(1) == 2 | ActiveCounter(1) == 3)
							ActiveCounter(2) = 1;
							disp('Counter 1 is now in operation.');
							CounterServiceNow = 1;
						end
					elseif (MaxCounter == 2)
						MaxCounter = 3;
						if ((ActiveCounter(1) == 1 & ActiveCounter(2) == 2) | (ActiveCounter(1) == 2 & ActiveCounter(2) == 1))
							ActiveCounter(3) = 3;
							disp('Counter 3 is now in operation.');
							CounterServiceNow = 3;
						elseif ((ActiveCounter(1) == 2 & ActiveCounter(2) == 3) | (ActiveCounter(1) == 3 & ActiveCounter(2) == 2))
							ActiveCounter(3) = 1;
							disp('Counter 1 is now in operation.');
							CounterServiceNow = 1;
						elseif ((ActiveCounter(1) == 1 & ActiveCounter(2) == 3) | (ActiveCounter(1) == 3 & ActiveCounter(2) == 1))
							ActiveCounter(3) = 2;
							disp('Counter 2 is now in operation.');
							CounterServiceNow = 2;
						end
					else
						SureNoCounterFree = 1;
					end
				end
				
				%one of the counter is available
				if (CounterServiceNow > 0)
					for i=1:6
						if (TicketSlot(Service_counter) == i)
							type = TicketType(Service_counter) + 1;
							if (ticketInformationTable(i,type) ~= 0)
								%change the number of tickets bought by current customer due to insufficient amount of tickets	
								if ((ticketInformationTable(i,type) - numOfTicket(Service_counter)) < 0)
									numOfTicket(Service_counter) = ticketInformationTable(i,type);
								end
								
								AllServe = AllServe + 1;
								ticketInformationTable(i,type) = ticketInformationTable(i,type) - numOfTicket(Service_counter);
								DepartureTime(Service_counter) = ArrivalTime(Service_counter) + WaitingMinute(Service_counter) + ServiceTime(Service_counter);
								fprintf('Service for customer No.%3.0f starts at minute %4.0f at Counter %1.0f, waited %4.0f minute, service time is %2.0f, purchased %2.0f tickets of type %1.0f on day %1.0f and paid RM%6.2f.\n',Service_counter,Minute,CounterServiceNow,WaitingMinute(Service_counter),ServiceTime(Service_counter),numOfTicket(Service_counter),TicketType(Service_counter),TicketSlot(Service_counter),AmountPaid(Service_counter));
								
								%check whether the purchased ticket is selling fast
								day = TicketSlot(Service_counter);
								if (ticketInformationTable(day,type) <= 10 & ticketInformationTable(day,type) > 0)
									fprintf('Ticket type %1.0f on day %1.0f will be sold out soon.\n',type-1,day);
								elseif (ticketInformationTable(day,type) == 0)
									fprintf('Ticket type %1.0f on day %1.0f sold out.\n',type-1,day);
								end
								
								%check whether all tickets have been sold out
								ticketSold = ticketSold + numOfTicket(Service_counter);
								if (ticketSold == totalTicket)
									disp('All tickets SOLD OUT!');
									fprintf('Departure of customer No.%3.0f at minute %4.0f.\n',Service_counter,DepartureTime(Service_counter));
									AllticketSoldOut = 1;
									break;
								end
								
								%set the serving counter to busy (1 = free, 0 = busy)
								if (CounterServiceNow == 1)
									FreeCounterOne = 0;
								elseif (CounterServiceNow == 2)
									FreeCounterTwo = 0;
								elseif (CounterServiceNow == 3)
									FreeCounterThree = 0;
								end
								break;
							elseif (ticketInformationTable(i,type) == 0)%if the wanted ticket is sold out
								DepartureTime(Service_counter) = Minute;
								fprintf('FAIL: Service for customer No.%3.0f starts at minute %4.0f at Counter %1.0f, waited %4.0f minute, fail to purchased %2.0f tickets of type %1.0f on day %1.0f, ticket sold out.\n',Service_counter,Minute,CounterServiceNow,WaitingMinute(Service_counter),numOfTicket(Service_counter),TicketType(Service_counter),TicketSlot(Service_counter));
								fprintf('Departure of customer No.%3.0f at minute %4.0f.\n',Service_counter,Minute);
								AllDepart = AllDepart + 1;
								break;
							end
						end
					end
					
					StartServingTime(Service_counter) = Minute;
					CanDepartList(CanDepart_counter) = Service_counter;
					CanDepart_counter = CanDepart_counter + 1;
					CounterServiceNowArray(Service_counter) = CounterServiceNow;
					
					if (Service_counter < numCust)
						Service_counter = Service_counter + 1;
					else
						Service_counter = 1;
					end
				end
			end
			
			%quit the geneting messages loop if all tickets are sold out
			if (AllticketSoldOut == 1)
				break;
			end
			
			%check whether there are queuing customer(s) and increment their waiting time if needed
			if (MaxCounter == 3 & Service_counter <= CustNo & Service_counter ~= 1 & (CurrentCustNoArrived == 1 | AllArrive == numCust))
				for i=Service_counter:CustNo
					WaitingMinute(i) = WaitingMinute(i) + 1;
				end
			elseif (MaxCounter == 3 & Service_counter < CustNo & Service_counter ~= 1 & CurrentCustNoArrived == 0)
				for i=Service_counter:(CustNo-1)
					WaitingMinute(i) = WaitingMinute(i) + 1;
				end
			end
		end

		if (CustNo < numCust & CurrentCustNoArrived == 1)
			CustNo = CustNo + 1;
		end
		Minute = Minute + 1;
	end
	
	%displaying general information
	disp('+-----+---------------+---------------+---------+----------------+-------------+-------------+--------+-----------+-----------+');
    disp('|     |    RNs for    | Inter-arrival | Arrival | RNs for ticket | Ticket slot | RN for the  | Ticket | Number of | Total     |');
    disp('|  n  | Inter-arrival |     time      |  time   |    slot/day    |    /day     | ticket type | type   |  tickets  | amount to |');
    disp('|     |     time      |               |         |                |             |             |        | purchased | be paid   |');
    disp('+-----+---------------+---------------+---------+----------------+-------------+-------------+--------+-----------+-----------+');
	for i=1:CustNo
		fprintf('| %4.0f|     %3.0f       |       %1.0f       |   %4.0f  |      %3.0f       |      %1.0f      |     %3.0f     |   %1.0f    |    %2.0f     |  %6.2f   |\n',i,rnInterArrival(i),InterArrival(i),ArrivalTime(i),rnTicketSlot(i),TicketSlot(i),rnTicketType(i),TicketType(i),numOfTicket(i),AmountPaid(i));
	end
	disp('+-----+---------------+---------------+---------+----------------+-------------+-------------+--------+-----------+-----------+');
	fprintf('\n\n');
	
	TimeSpent = zeros(1,CustNo);
	c = 0;
	count = 0;
	
	%displaying information of counter(s)
	for j=1:MaxCounter
		count = count + 1;
		if (MaxCounter == 3)
			c = c + 1;
		elseif (MaxCounter == 2)
			if ((ActiveCounter(1) == 1 & ActiveCounter(2) == 2) | (ActiveCounter(1) == 2 & ActiveCounter(2) == 1))
				c = c + 1;
			elseif ((ActiveCounter(1) == 1 & ActiveCounter(2) == 3) | (ActiveCounter(1) == 3 & ActiveCounter(2) == 1))
				if (count == 1)
					c = 1;
				elseif (count == 2)
					c = 3;
				end
			elseif ((ActiveCounter(1) == 2 & ActiveCounter(2) == 3) | (ActiveCounter(1) == 3 & ActiveCounter(2) == 2))
				if (count == 1)
					c = 2;
				elseif (count == 2)
					c = 3;
				end
			end
		elseif (MaxCounter == 1)
			c = ActiveCounter(1);
		end
		fprintf('Counter %1.0f: \n',c);
		disp('+-----+--------------+--------------+--------------+--------------+--------------+---------------+');
		disp('|  n  |    RNs for   | Service Time | Time Service | Time Service | Waiting Time | Time Spent In |');
		disp('|     | Service Time |              |    Begins    |     End      |              | The System    |');
		disp('+-----+--------------+--------------+--------------+--------------+--------------+---------------+');
		
		CounterTotalWaitingMinute = 0;
		CounterTotalTimeSpent = 0;
		CounterTotalServiceTime = 0;
		CounterTotalSales = 0;
		NumCustServed = 0;
		
		for i=1:CustNo
			if (CounterServiceNowArray(i) == c)
				TimeSpent(i) = DepartureTime(i) - ArrivalTime(i);
				
				%calculation for analysis
				CounterTotalWaitingMinute = CounterTotalWaitingMinute + WaitingMinute(i);
				CounterTotalTimeSpent = CounterTotalTimeSpent + TimeSpent(i);
				if (TimeSpent(i) ~= 0)
					CounterTotalServiceTime = CounterTotalServiceTime + ServiceTime(i);
				end
				NumCustServed = NumCustServed + 1;
				CounterTotalSales = CounterTotalSales + AmountPaid(i);
				
				fprintf('| %3.0f |     %3.0f      |      %2.0f      |    %4.0f      |    %4.0f      |    %3.0f       |      %3.0f      |\n',i,rnServiceTime(i),ServiceTime(i),StartServingTime(i),DepartureTime(i),WaitingMinute(i),TimeSpent(i));
			end
		end
		disp('+-----+--------------+--------------+--------------+--------------+--------------+---------------+');
		
		CounterAverageWaitingMinute = CounterTotalWaitingMinute / NumCustServed;
		CounterAverageTimeSpent = CounterTotalTimeSpent / NumCustServed;
		CounterAverageServiceTime = CounterTotalServiceTime / NumCustServed;
		CounterPercBusyTime = CounterTotalServiceTime / DepartureTime(CustNo);
		
		fprintf('Counter %1.0f: Number of customers served: %4.0f.\n',c,NumCustServed);
		fprintf('Counter %1.0f: Total waiting time(Minutes): %6.2f.\n',c,CounterTotalWaitingMinute);
		fprintf('Counter %1.0f: Average waiting time(Minutes): %6.2f.\n',c,CounterAverageWaitingMinute);
		fprintf('Counter %1.0f: Total time spent(Minutes): %6.2f.\n',c,CounterTotalTimeSpent);
		fprintf('Counter %1.0f: Average time spent(Minutes): %6.2f.\n',c,CounterAverageTimeSpent);
		fprintf('Counter %1.0f: Total service time(Minutes): %6.2f.\n',c,CounterTotalServiceTime);
		fprintf('Counter %1.0f: Average service time(Minutes): %6.2f.\n',c,CounterAverageServiceTime);
		fprintf('Counter %1.0f: Percentage of busy time(Minutes): %5.2f.\n',c,CounterPercBusyTime);
		fprintf('Counter %1.0f: Total sales: RM%6.2f.\n',c,CounterTotalSales);
		fprintf('\n\n');
	end
	
	%displaying information of remaining tickets
	disp('+------+-----------------------------------------------+');
	disp('| Day/ |         Number of remaining ticket            |');
	disp('| Slot +---------------+---------------+---------------+');
	disp('|      | Ticket Type 1 | Ticket Type 2 | Ticket Type 3 |');
	disp('+------+---------------+---------------+---------------+');
	for i=1:6
		fprintf('|  %1.0f   |     %3.0f       |     %3.0f       |      %3.0f      |\n',ticketInformationTable(i,1),ticketInformationTable(i,2),ticketInformationTable(i,3),ticketInformationTable(i,4));
	end
	disp('+------+---------------+---------------+---------------+');
	fprintf('\n\n');
	
	TotalInterArrival = 0;
	TotalWaitingMinute = 0;
	NumWaitingCust = 0;
	TotalServiceTime = 0;
	TotalTimeSpent = 0;
	TotalTicketPurchased = 0;
	TotalTicketOnePurchased = 0;
	TotalTicketTwoPurchased = 0;
	TotalTicketThreePurchased = 0;
	TotalSales = 0;
	NumCustFailToPurchase = 0;
	NumOfTicketFailToPurchase = 0;
	
	%calculation
	for i=1:CustNo
		TotalInterArrival = TotalInterArrival + InterArrival(i);
		TotalServiceTime = TotalServiceTime + ServiceTime(i);
		TotalTimeSpent = TotalTimeSpent + TimeSpent(i);
		TotalSales = TotalSales + AmountPaid(i);
		
		TotalWaitingMinute = TotalWaitingMinute + WaitingMinute(i);
		if (WaitingMinute(i) ~= 0)
			NumWaitingCust = NumWaitingCust + 1;
		end
		
		if (TimeSpent(i) ~= 0)
			TotalTicketPurchased = TotalTicketPurchased + numOfTicket(i);
			if (TicketType(i) == 1)
				TotalTicketOnePurchased = TotalTicketOnePurchased + numOfTicket(i);
			elseif (TicketType(i) == 2)
				TotalTicketTwoPurchased = TotalTicketTwoPurchased + numOfTicket(i);
			elseif (TicketType(i) == 3)
				TotalTicketThreePurchased = TotalTicketThreePurchased + numOfTicket(i);
			end
		elseif (TimeSpent(i) == 0)
			NumCustFailToPurchase = NumCustFailToPurchase + 1;
			NumOfTicketFailToPurchase = NumOfTicketFailToPurchase + numOfTicket(i);
		end
	end
	
	%displaying average inter-arrival time
	disp('*****************************************************************************************************************');
	AverageInterArrival = TotalInterArrival / CustNo;
	fprintf('Average inter-arrival time(Minutes): %4.2f\n',AverageInterArrival);
	disp('*****************************************************************************************************************');
	
	%displaying total and average waiting time, probability a customer needs to wait
	if (NumWaitingCust ~= 0)
		AverageWaitingMinute = TotalWaitingMinute / NumWaitingCust;
	else
		AverageWaitingMinute = 0;
	end
	ProbWaitingCust = NumWaitingCust / CustNo;
	fprintf('Total customers waited: %4.0f\n',NumWaitingCust);
	fprintf('Total waiting time(Minutes): %6.2f\n',TotalWaitingMinute);
	fprintf('Average waiting time of each customer(Minutes): %6.2f\n',AverageWaitingMinute);
	fprintf('Probability a customer needs to wait: %10.4f\n',ProbWaitingCust);
	disp('*****************************************************************************************************************');
	
	%displaying total and average service time
	AverageServiceTime = TotalServiceTime / CustNo;
	fprintf('Total service time(Minutes): %6.2f\n',TotalServiceTime);
	fprintf('Average service time of each customer(Minutes): %6.2f\n',AverageServiceTime);
	disp('*****************************************************************************************************************');
	
	%displaying total and average time spent
	AverageTimeSpent = TotalTimeSpent / CustNo;
	fprintf('Total time spent(Minutes): %6.2f\n',TotalTimeSpent);
	fprintf('Average time spent of each customer(Minutes): %6.2f\n',AverageTimeSpent);
	disp('*****************************************************************************************************************');
	
	%displaying the total and average of purchased tickets
	AverageTicketPurchased = TotalTicketPurchased / CustNo;
	fprintf('Total ticket purchased: %4.0f\n',TotalTicketPurchased);
	fprintf('--Type 1: %3.0f\n',TotalTicketOnePurchased);
	fprintf('--Type 2: %3.0f\n',TotalTicketTwoPurchased);
	fprintf('--Type 3: %3.0f\n',TotalTicketThreePurchased);
	fprintf('Average ticket purchased by each customer: %2.0f(~%6.2f)\n',round(AverageTicketPurchased),AverageTicketPurchased);
	disp('*****************************************************************************************************************');
	
	%displaying probability purchasing each ticket
	PercTicketOnePurchased = TotalTicketOnePurchased / TotalTicketPurchased;
	PercTicketTwoPurchased = TotalTicketTwoPurchased / TotalTicketPurchased;
	PercTicketThreePurchased = TotalTicketThreePurchased / TotalTicketPurchased;
	fprintf('Probability to purchase each type of ticket:\n');
	fprintf('--Type 1: %10.4f\n',PercTicketOnePurchased);
	fprintf('--Type 2: %10.4f\n',PercTicketTwoPurchased);
	fprintf('--Type 3: %10.4f\n',PercTicketThreePurchased);
	disp('*****************************************************************************************************************');

	%displaying sales of each counter
	AverageSales = TotalSales / MaxCounter;
	fprintf('Total sales: RM%6.2f\n',TotalSales);
	fprintf('Average sales by each counter: RM%6.2f\n',AverageSales);
	disp('*****************************************************************************************************************');
	
	%displaying number of customers that fail to purchase wanted tickets
	PercCustFailToPurchase = NumCustFailToPurchase / CustNo;
	fprintf('Number of customers fail to purchase: %4.0f\n',NumCustFailToPurchase)
	fprintf('Probability of customers fail to purchase: %10.4f\n',PercCustFailToPurchase)
	disp('*****************************************************************************************************************');