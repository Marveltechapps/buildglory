import 'package:buildglory/final/contactus/bloc/contactus_event.dart';
import 'package:buildglory/final/contactus/bloc/contactus_state.dart';
import 'package:buildglory/final/contactus/model/contactus_response_model.dart';
import 'package:buildglory/generated/services/enquiry_service.dart';
import 'package:buildglory/generated/models/enquiry.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactusBloc extends Bloc<ContactusEvent, ContactusState> {
  final EnquiryService _enquiryService;

  ContactusBloc({required EnquiryService enquiryService})
      : _enquiryService = enquiryService,
        super(ContactusInitialState()) {
    on<SaveContactDataApiEvent>(savecontact);
  }

  Future<void> savecontact(
    SaveContactDataApiEvent event,
    Emitter<ContactusState> emit,
  ) async {
    emit(ContactusLoadingState());
    
    try {
      // Parse type string to EnquiryType enum
      EnquiryType enquiryType;
      if (event.type.toLowerCase() == 'buy') {
        enquiryType = EnquiryType.buy;
      } else if (event.type.toLowerCase() == 'exchange') {
        enquiryType = EnquiryType.exchange;
      } else {
        emit(ContactusErrorState(errorMsg: 'Invalid enquiry type'));
        return;
      }

      print('📤 Submitting enquiry: ${event.propertyId}, ${event.type}');

      // Submit enquiry using generated service
      final response = await _enquiryService.submitEnquiry(
        propertyId: event.propertyId,
        type: enquiryType,
        message: event.message.isNotEmpty ? event.message : null,
      );

      if (response.isSuccess) {
        print('✅ Enquiry submitted successfully');
        
        // Create response model for compatibility with existing UI
        final contactUsResponseModel = ContactUsResponseModel(
          message: 'Enquiry submitted successfully',
        );
        
        emit(ContactDataApiSuccessState(
          contactUsResponseModel: contactUsResponseModel,
        ));
      } else {
        print('❌ Enquiry failed: ${response.error?.message}');
        emit(ContactusErrorState(
          errorMsg: response.error?.message ?? 'Failed to submit enquiry',
        ));
      }
    } catch (e) {
      print('❌ Enquiry error: $e');
      emit(ContactusErrorState(
        errorMsg: 'An error occurred while submitting enquiry',
      ));
    }
  }
}
