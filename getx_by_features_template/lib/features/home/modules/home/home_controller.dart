import 'package:injectable/injectable.dart';

import '../../../../shared/base/base_controller.dart';

@Injectable()
class HomeController extends BaseController {
  HomeController(super.navigation, super.errorNotifier);
}
