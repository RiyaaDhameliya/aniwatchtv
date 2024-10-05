import 'package:aniwatch_tv/constant/app_textstyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constant/app_string.dart';
import 'common_widgets.dart';

class PrivacyPolicyBottomSheet extends StatelessWidget {
  const PrivacyPolicyBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.93,
      minChildSize: 0.5,
      maxChildSize: 1.0,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child:  Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildSizedBoxH(20),
                const Text(
                  AppString.privacyPolicy,
                  style: white20bold,
                ),
                buildSizedBoxH(20),
                const Text(
                  'AnimeCall built the AnimeCall app as a Free app. '
                  'This SERVICE is provided by AnimeCall at no cost and is intended for use as is.',
                  style: white16,
                ),
                buildSizedBoxH(20),
                const Text(
                    'This page is used to inform visitors regarding my policies with the collection, use, and '
                    'disclosure of Personal Information if anyone decided to use my Service.',
                    style: white16),
                buildSizedBoxH(20),
                const Text(
                    'If you choose to use my Service, then you agree to the collection and use of information in relation to this policy.'
                    'The Personal Information that I collect is used for providing and improving the Service. I will not '
                    'use or share your information with anyone except as described in this Privacy Policy.',
                    style: white16),
                buildSizedBoxH(20),
                const Text(
                    'The terms used in this Privacy Policy have the same meanings as in our Terms and '
                    'Conditions, which are accessible at AnimeCall unless otherwise defined in this Privacy Policy.',
                    style: white16),
                buildSizedBoxH(20),
                const Text('Information Collection and Use', style: white17W700),
                buildSizedBoxH(20),
                const Text(
                    'For a better experience, while using our Service, I may require you to provide us with certain '
                    'personally identifiable information, including but not limited to name.'
                    'The information that I request will be retained on your device and is not collected by me in any way.',
                    style: white16),
                buildSizedBoxH(20),
                const Text('Log Data', style: white17W700),
                buildSizedBoxH(20),
                const Text(
                    'I want to inform you that whenever you use my Service, in a '
                    'case of an error in the app I collect data and information'
                    ' (through third-party products) on your phone called Log'
                    ' Data. This Log Data may include information such as'
                    ' your device Internet Protocol ("IP") address, device name, operating system version, the configuration '
                    'of the app when utilizing my Service, the time and date of your use of the Service, and other statistics',
                    style: white16),
                buildSizedBoxH(20),
                const Text('Cookies', style: white17W700),
                buildSizedBoxH(20),
                const Text(
                    'Cookies are files with a small amount of data that are commonly'
                    ' used as anonymous unique identifiers. These are sent to your browser '
                    'from the websites that you visit and are stored on your devices internal memory.',
                    style: white16),
                buildSizedBoxH(20),
                const Text(
                    'This Service does not use these "cookies" explicitly.'
                    'However, the app may use third-party code and libraries that'
                    ' use "cookies" to collect information and improve their services. You have'
                    ' the option to either accept or refuse these cookies and know when a cookie is being '
                    'sent to your device. If you choose to refuse our cookies, you may not be able to use '
                    'some portions of this Service.',
                    style: white16),
                buildSizedBoxH(20),
                const Text('Service Providers', style: white17W700),
                buildSizedBoxH(20),
                const Text(
                    "I may employ third-party companies and individuals due to the following reasons:",
                    style: white16),
                buildSizedBoxH(20),
                const Text(
                    '*   To facilitate our Service;\n'
                    '*   To provide the Service on our behalf;\n'
                    '*   To perform Service-related services; or\n'
                    '*   To assist us in analyzing how our Service is used.',
                    style: white16),
                buildSizedBoxH(20),
                const Text(
                    'I want to inform users of this Service that these third parties have '
                    'access to their Personal Information. The reason is to perform the tasks assigned'
                    ' to them on our behalf. However, they are obligated not to disclose or use the information '
                    'for any other purpose.',
                    style: white16),
                buildSizedBoxH(20),
                const Text('Security', style: white17W700),
                buildSizedBoxH(20),
                const Text(
                    'I value your trust in providing us your Personal Information, thus '
                    'we are striving to use commercially acceptable means of protecting it. '
                    'But remember that no method of transmission over the internet, or method '
                    'of electronic storage is 100% secure and reliable, and I cannot guarantee its absolute security.',
                    style: white16),
                buildSizedBoxH(20),
                const Text('Links to Other Sites', style: white17W700),
                buildSizedBoxH(20),
                const Text(
                    'This Service may contain links to other sites. If you click on '
                    'a third-party link, you will be directed to that site. Note that '
                    'these external sites are not operated by me. Therefore, I strongly '
                    'advise you to review the Privacy Policy of these websites. I have no control over '
                    'and assume no responsibility for the content, privacy policies, or practices of any'
                    ' third-party sites or services.',
                    style: white16),
                buildSizedBoxH(20),
                const Text('Childrens Privacy', style: white17W700),
                buildSizedBoxH(20),
                const Text(
                    'I do not knowingly collect personally identifiable information from children. '
                    'I encourage all children to never submit any personally identifiable information '
                    'through the Application and/or Services. I encourage parents and legal guardians '
                    'to monitor their childrens Internet usage and to help enforce this Policy by '
                    'instructing their children never to provide personally identifiable information '
                    'through the Application and/or Services without their permission. If you have '
                    'reason to believe that a child has provided personally identifiable information '
                    'to us through the Application and/ or Services, please contact us. You must also '
                    'be at least 16 years of age to consent to the processing of your personally '
                    'identifiable information in your country (in some countries we may allow your '
                    'parent or guardian to do so o your behalf).',
                    style: white16),
                buildSizedBoxH(20),
                const Text('Changes to This Privacy Policy', style: white17W700),
                buildSizedBoxH(20),
                const Text(
                    'I may update our Privacy Policy from time to time. Thus, you are advised to review '
                    'this page periodically for any changes. I will notify you of any changes by posting '
                    'the new Privacy Policy on this page.',
                    style: white16),
                buildSizedBoxH(20),
                const Text('This policy is effective as of 2022-08-24',
                    style: white16),
                buildSizedBoxH(20),
                const Text('Contact Us', style: white17W700),
                buildSizedBoxH(20),
                const Text(
                    'If you have any questions or suggestions about my PrivacyPolicy, do not hesitate to contact me at',
                    style: white16),
                const Text('forgoodapps.10@gmail.com.', style: lightYellowColor),
                buildSizedBoxH(20),
                const Text(
                    'This privacy policy page was created at '
                    'privacypolicytemplate.net and modified/generated by',
                    style: white16),
                const Text(
                  'App '
                  'Privacy Policy Generator',
                  style: lightYellowColor,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
