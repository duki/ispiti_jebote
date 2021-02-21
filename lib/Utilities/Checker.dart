import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:ispiti_jebote/Types/Course.dart';
import 'package:ispiti_jebote/Utilities/CourseInfoStore.dart';
import 'package:ispiti_jebote/Widgets/Dialogs/AlertChangeDialog.dart';
import 'package:path_provider/path_provider.dart';

class Checker {
	final BuildContext _context;
	Checker(this._context);

	Future<int> urlWorth(String urlpath) async {
		if(urlpath == null) {
			return -2;
		}
		final response = await http.get(urlpath);

		if (response.statusCode == 200) {
			print("we have lift off!");
			print(response.contentLength);
			return response.contentLength;
		} else {
			return -1;
		}
	}

	Future<void> editSelected(List<Course> x) async {
			for(int i = 0; i < x.length; i++) {
					int lul = await urlWorth(x[i].courseAddr);
					if(lul == x[i].respLength) {
						print("no change in ${x[i].courseName}");
					} else {
						AlertChangeDialog a1 = new AlertChangeDialog();
						a1.createAlertDialog(_context, x[i]);
						print("changed in ${x[i].courseName}");
						CourseInfoStore c1 = new CourseInfoStore();
						await c1.changeResponseLength(x[i], lul);
					}
			}
	}

	Future<String> get _localPath async {
		final directory = await getApplicationDocumentsDirectory();
		return directory.path;
	}
}
