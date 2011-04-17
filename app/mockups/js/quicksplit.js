$(document).ready(function() {
	$('#submit').click(function() {
		var names = $('.quicksplit_name');		
		var amounts = $('.quicksplit_amount');
		
		var total = 0;
		for(var i = 0; i < amounts.length; i++) {
			total += Number(amounts[i].value);
		}
		
		var expectedContribution = total/amounts.length;

		var owed = []; // people who are owed
		var owers = []; // people who owe others
		var neither = [];
		for(var i = 0; i < amounts.length; i++) {
			var amountOwed = (expectedContribution - amounts[i].value)*-1;
			var person = {
				'name': names[i].value,
				'amountOwed': amountOwed,
				'contributed': Number(amounts[i].value),
				'owedTo': [],
				'owedFrom': []
			};
			
			if(amountOwed < 0) {
				owers.push(person);
			} else if (amountOwed > 0) {
				owed.push(person);
			} else {
				neither.push(person);
			}
		}
	
		var totalOwed = 0;
		for(var i = 0; i < owed.length; i++) {
			totalOwed += owed[i].amountOwed;
		}
		
		for(var i = 0; i < owed.length; i++) {
			var curr = owed[i];
			var owedAmt = curr.amountOwed;
			var pctFromEachOwer = owedAmt/totalOwed;
			
			// add the person to each ower
			for(var j = 0; j < owers.length; j++) {
				var ower = owers[j];
				var amountOwed = Math.abs((pctFromEachOwer * ower.amountOwed).toFixed(2));
				
				var data = {
					'name': ower.name,
					'amount': amountOwed
				}
				curr.owedFrom.push(data);
				
				var other = {
					'name': curr.name,
					'amount': amountOwed
				}
				ower.owedTo.push(other);
			}
		}
				
		//console.dir(owed);
		//console.dir(owers);
		
		var output = "<ul class='results'>";
		for(var i = 0; i < neither.length; i++) {
			output += "<li class='result_item'>";
			var curr = owed[i];
			output += "<h3 class='name'><span class='bold'>" +curr.name +"</span> ";
			output += "owes and is owed nothing!</h3></li>"
		}
		
		for(var i = 0; i < owed.length; i++) {
			output += "<li class='result_item'>"
			var curr = owed[i];
			output += "<h3 class='name'><span class='bold'>" +curr.name +"</span> ";
			output += "<span class='green'>+ $" +Math.abs(curr.amountOwed) +"</span></h3><ul>";
			for(var j = 0; j < curr.owedFrom.length; j++) {
				var p = curr.owedFrom[j];
				output += "<li class='owed'>Owed $" +p.amount +" from <span class='bold'>" +p.name +"</span></li>";
			}
			output += "</ul></li>"
			// TODO print values
		}
		
		for(var i = 0; i < owers.length; i++) {
			output += "<li class='result_item'>"
			var curr = owers[i];
			output += "<h3 class='name'><span class='bold'>" +curr.name +"</span> ";
			output += "<span class='red'>- $" +Math.abs(curr.amountOwed) +"</span></h3><ul>";
			for(var j = 0; j < curr.owedTo.length; j++) {
				var p = curr.owedTo[j];
				output += "<li class='owed'>Owes <span class='bold'>" +p.name +" $" +p.amount +"</span></li>";
			}
			output += "</ul></li>"
		}
		
		output += "</ul>"
		console.log(output);		
		$('#quicksplit_result').html(output);
		
		$('.quicksplit_list').hide();
		$('#submit').hide();
		$('.main_title').html("Quick Split Results");
	});
});