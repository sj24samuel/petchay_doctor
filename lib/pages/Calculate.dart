
import 'package:flutter/material.dart';

class Calculate extends StatefulWidget {
  const Calculate({Key? key}) : super(key: key);

  @override
  State<Calculate> createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {
  final TextEditingController _hectaresControllerf = TextEditingController();
  final TextEditingController _hectaresControllerp = TextEditingController();
  String _resultf = '';
  String _resultp = '';

  //Fertlizer Radio Button
  String _SelectedFertilizer = 'Urea';
  final Map<String, double> _fertRec = {
    'Urea': 50.0,
    'Complete': 120.0,
    'Ammonium Nitrate': 100.0,
  };

  //Pesticide Radio Button
  String _SelcetedPesticide = 'Metalaxyl';
  final Map<String, double> _pestRec = {
    'Metalaxyl': 1.0,
    'Mancozeb': 3.0,
    'Lime': 2000.0,
    'Chlorothalonil': 2.0,
  };

  double _frecamount = 0.0;


  void _calculatef() {
    // Logic to calculate the amount based on hectares
    double hectares = double.tryParse(_hectaresControllerf.text) ?? 0;
    // Example calculation (you can replace it with your own logic)
    double amount = hectares * _fertRec[_SelectedFertilizer]!; // Example calculation
    _frecamount = amount;
    double amountprepare = amount / 2;
    setState(() {
      _resultf = 'Approx. Total amount of fertilizer needed: $_frecamount Kg \n\n Approx. amount of fertilizer for Pre-Planting is: $amountprepare Kg \n\n Approx. amount of fertilizer for Maintaninance: $amountprepare Kg';
    });
  }

    void _calculatep() {
    // Logic to calculate the amount based on hectares
    double hectares = double.tryParse(_hectaresControllerp.text) ?? 0;
    // Example calculation (you can replace it with your own logic)
    double amount = hectares * _pestRec[_SelcetedPesticide]!; // Example calculation
  
    setState(() {
      _resultp = 'Approx. Total amount of Pesticide needed in Foliar/Soil Application: $amount kg ';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculate'),
      ),
      body: SingleChildScrollView(
        //height: 300, // Adjust the height as needed
        child: Card(
          elevation: 4,
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Fertilizer
                Text('Fertilizer Calculation', 
                style: const TextStyle(fontSize: 20, fontFamily: 'Arial'),
                 textAlign:TextAlign.center,
                 ),
                TextField(
                  controller: _hectaresControllerf,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter the Approximate Area to Apply Fertilizer in Hectares',
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Fertilizer Type of Substance',
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                //Radio Button
                ListTile(
                  title: const Text('Urea'),
                  leading: Radio<String>(
                    value: 'Urea',
                    groupValue: _SelectedFertilizer,
                    onChanged: (String? value) {
                      setState(() {
                        _SelectedFertilizer = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Complete'),
                  leading: Radio<String>(
                    value: 'Complete',
                    groupValue: _SelectedFertilizer,
                    onChanged: (String? value) {
                      setState(() {
                        _SelectedFertilizer = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Ammonium Nitrate'),
                  leading: Radio<String>(
                    value: 'Ammonium Nitrate',
                    groupValue: _SelectedFertilizer,
                    onChanged: (String? value) {
                      setState(() {
                        _SelectedFertilizer = value!;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _calculatef,
                  child: const Text('Calculate'),
                ),
                const SizedBox(height: 20),
                Text(
                  _resultf,
                  style: const TextStyle(fontSize: 16),
                ),
                Image.asset(
                  'assets/images/calculate.gif', // Path to local image asset
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                //Pesticides calculator
                SizedBox(height: 10),
                Text('Pesticides Calculation', 
                style: const TextStyle(fontSize: 16),
                 textAlign:TextAlign.center,
                 ),
                TextField(
                  controller: _hectaresControllerp,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter the Approximate Area to Apply Pesticides in Hectares',
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Pesticide Substance',
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                //Radio Pesticides
                ListTile(
                  title: const Text('Metalaxyl'),
                  leading: Radio<String>(
                    value: 'Metalaxyl',
                    groupValue: _SelcetedPesticide,
                    onChanged: (String? value) {
                      setState(() {
                        _SelcetedPesticide = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Mancozeb'),
                  leading: Radio<String>(
                    value: 'Mancozeb',
                    groupValue: _SelcetedPesticide,
                    onChanged: (String? value) {
                      setState(() {
                        _SelcetedPesticide = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Lime'),
                  leading: Radio<String>(
                    value: 'Lime',
                    groupValue: _SelcetedPesticide,
                    onChanged: (String? value) {
                      setState(() {
                        _SelcetedPesticide = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Chlorothalonil'),
                  leading: Radio<String>(
                    value: 'Chlorothalonil',
                    groupValue: _SelcetedPesticide,
                    onChanged: (String? value) {
                      setState(() {
                        _SelcetedPesticide = value!;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _calculatep,
                  child: const Text('Calculate'),
                ),
                const SizedBox(height: 20),
                Text(
                  _resultp,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _hectaresControllerf.dispose();
    super.dispose();
  }

}