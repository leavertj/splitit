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
			var amountOwed = expectedContribution - amounts[i].value;
			var person = {
				'name': names[i].value,
				'amountOwed': amountOwed,
				'owedTo': [],
				'owedFrom': []
			};
			
			if(amountOwed > 0) {
				owers.push(person);
			} else if (amountOwed < 0) {
				owed.push(person);
			} else {
				neither.push(person);
			}
		}
		//console.log(total);		
		console.log("expectedContribution = " +expectedContribution);
		console.log("owed");
		console.dir(owed);
		console.log("owers");
		console.dir(owers);
		console.log("neithers");
		console.dir(neither);
		console.log("BEFORE");
		
		for(var i = 0; i < owed.length; i++) {
			var curr = owed[i];
			var owed = curr.amountOwed;
			var owedFromEachOwer = Math.abs((owed/owers.length).toFixed(2));
			
			// add the person to each ower
			for(var j = 0; j < owers.length; j++) {
				var ower = owers[j];
				var data = {
					'name': ower.name,
					'amount': owedFromEachOwer
				}
				curr.owedFrom.push(data);
				
				var other = {
					'name': curr.name,
					'amount': owedFromEachOwer
				}
				ower.owedTo.push(other);
			}
			console.dir(curr);
		}
		
		console.log("AFTER");
		console.log("owed");
		console.dir(owed);
		console.log("owers");
		console.dir(owers);
		console.log("neithers");
		console.dir(neither);
		
		/*
			1. Look for negatives. Means they are owed $$
			2. Positives owe negatives.
		*/
		
		
		//$('#quicksplit_results').html('submit was clicked!');
		
		//hideStuff();
		//$('.main_title').html("Quick Split Results");
	});
});

hideStuff = function() {
	$('.quicksplit_list').hide();
	$('#submit').hide();
}