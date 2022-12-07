library hms_models;

//region Backend
  //region Common
  export 'backend/common/firestore_controller.dart';
  export 'backend/common/cloudinary_controller.dart';
  //endregion

  //region Patient
  export 'backend/patient/patient_controller.dart';
  export 'backend/patient/patient_repository.dart';
  //endregion

  //region Visit
  export 'backend/visit/visit_controller.dart';
  export 'backend/visit/visit_repository.dart';
  //endregion
//endregion

//region Configs
export 'configs/cloudinary_transformations.dart';
export 'configs/constants.dart';
export 'configs/typedefs.dart';
//endregion

//region Models

  //region Admin User
  export 'models/admin_user/admin_user_model.dart';
  //endregion

  //region Common
  export 'models/common/new_document_data_model.dart';
  //endregion

  //region Patient
  export 'models/patient/patient_model.dart';
  //endregion

  //region Visit Model
  export 'models/qr_code/qr_code_data_model.dart';
  //endregion

  //region Visit Model

    //region Diagnosis
    export 'models/visit_model/diagnosis/diagnosis_model.dart';
    export 'models/visit_model/diagnosis/vitals_model.dart';
    //endregion

    //region Pharma Billings
    export 'models/visit_model/pharma_billings/pharma_billing_item_model.dart';
    export 'models/visit_model/pharma_billings/pharma_billing_model.dart';
    //endregion

    //region Prescription
    export 'models/visit_model/prescription/prescription_medicine_dose_model.dart';
    export 'models/visit_model/prescription/prescription_model.dart';
    //endregion

    //region Treatment Activity
    export 'models/visit_model/treatment_activity/treatment_activity_model.dart';
    //endregion

    //region Visit Billings
    export 'models/visit_model/visit_billings/visit_billing_model.dart';
    //endregion

    export 'models/visit_model/patient_meta_model.dart';
    export 'models/visit_model/visit_model.dart';

  //endregion

//endregion

//region Utils
export 'utils/cloudinary_manager.dart';
export 'utils/date_presentation.dart';
export 'utils/extensions.dart';
export 'utils/my_http_overrides.dart';
export 'utils/my_print.dart';
export 'utils/my_safe_state.dart';
export 'utils/my_toast.dart';
export 'utils/my_utils.dart';
export 'utils/parsing_helper.dart';
export 'utils/shared_pref_manager.dart';
export 'utils/size_config.dart';
export 'view/components/qr_scanner_dialog.dart';
//endregion

//region Packages

  //region Utils
  export 'package:equatable/equatable.dart';
  export 'package:intl/intl.dart';
  export 'package:shared_preferences/shared_preferences.dart';
  export 'package:uuid/uuid.dart';
  export 'package:cloudinary_sdk/cloudinary_sdk.dart';
  export 'package:connectivity_plus/connectivity_plus.dart';
  export 'package:qr_flutter/qr_flutter.dart';
  export 'package:file_picker/file_picker.dart';
  export 'package:image_picker/image_picker.dart';
  //endregion

  //region QR Scanner
  export 'package:mobile_scanner/mobile_scanner.dart' hide GeoPoint;
  //endregion

  //region UI
  export 'package:fluttertoast/fluttertoast.dart';
  export 'package:lottie/lottie.dart';
  export 'package:font_awesome_flutter/font_awesome_flutter.dart';
  export 'package:cupertino_icons/cupertino_icons.dart';
  export 'package:loading_animation_widget/loading_animation_widget.dart';
  export 'package:flutter_spinkit/flutter_spinkit.dart';
  export 'package:google_fonts/google_fonts.dart';
  export 'package:flutter_svg/flutter_svg.dart';
  export 'package:flutter_feather_icons/flutter_feather_icons.dart';
  export 'package:cached_network_image/cached_network_image.dart';
  //endregion

  // region UI
  export 'package:provider/provider.dart';
  //endregion

  //region Firebase
  export 'package:firebase_core/firebase_core.dart';
  export 'package:firebase_auth/firebase_auth.dart';
  export 'package:cloud_firestore/cloud_firestore.dart';
  export 'package:firebase_messaging/firebase_messaging.dart';
  export 'package:firebase_analytics/firebase_analytics.dart';
  export 'package:firebase_crashlytics/firebase_crashlytics.dart';
  //endregion

//endregion