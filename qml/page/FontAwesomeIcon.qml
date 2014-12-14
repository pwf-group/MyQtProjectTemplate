import QtQuick 2.4
import QtQuick.Controls 1.3
import UIConstants 1.0
import "../material_ui" as MaterialUI
import "../qml_bootstrap/variables/fontawesome.js" as FontAwesome

Item {
    ListView {
        id: itemList
        model: itemModel
        anchors.fill: parent
        anchors.topMargin: 48 * dp
        anchors.bottomMargin: 48 * dp
        boundsBehavior: Flickable.StopAtBounds

        delegate: Item {
            id: itemRoot
            width: parent.width
            height: 72 * dp

            Rectangle{
                anchors.fill: parent
                color: "transparent"
                border.width: 1 * dp
                border.color: "#cccccc"

                Label {
                    font.family: "FontAwesome"
                    font.pointSize: UIConstants.subheadFontSize
                    text: model.icon
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                    anchors.fill: parent
                    anchors.leftMargin: 16 * dp
                }

                Label {
                    id: content
                    font.pointSize: UIConstants.bodyFontSize
                    text: model.text
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                    anchors.fill: parent
                    anchors.leftMargin: 72 * dp
                }
            }

            MaterialUI.PaperRipple {
                id: ripple
                radius: 3 * dp
                mouseArea: mouseArea
            }
            MouseArea {
                id: mouseArea
                anchors.fill: parent
            }
        }
    }

    ListModel {
        id: itemModel
        ListElement { text: "fa_adjust               "; icon: "\uf042"; path: "" }
        ListElement { text: "fa_adn                  "; icon: "\uf170"; path: "" }
        ListElement { text: "fa_align_center         "; icon: "\uf037"; path: "" }
        ListElement { text: "fa_align_justify        "; icon: "\uf039"; path: "" }
        ListElement { text: "fa_align_left           "; icon: "\uf036"; path: "" }
        ListElement { text: "fa_align_right          "; icon: "\uf038"; path: "" }
        ListElement { text: "fa_ambulance            "; icon: "\uf0f9"; path: "" }
        ListElement { text: "fa_anchor               "; icon: "\uf13d"; path: "" }
        ListElement { text: "fa_android              "; icon: "\uf17b"; path: "" }
        ListElement { text: "fa_angellist            "; icon: "\uf209"; path: "" }
        ListElement { text: "fa_angle_double_down    "; icon: "\uf103"; path: "" }
        ListElement { text: "fa_angle_double_left    "; icon: "\uf100"; path: "" }
        ListElement { text: "fa_angle_double_right   "; icon: "\uf101"; path: "" }
        ListElement { text: "fa_angle_double_up      "; icon: "\uf102"; path: "" }
        ListElement { text: "fa_angle_down           "; icon: "\uf107"; path: "" }
        ListElement { text: "fa_angle_left           "; icon: "\uf104"; path: "" }
        ListElement { text: "fa_angle_right          "; icon: "\uf105"; path: "" }
        ListElement { text: "fa_angle_up             "; icon: "\uf106"; path: "" }
        ListElement { text: "fa_apple                "; icon: "\uf179"; path: "" }
        ListElement { text: "fa_archive              "; icon: "\uf187"; path: "" }
        ListElement { text: "fa_arrow_circle_down    "; icon: "\uf0ab"; path: "" }
        ListElement { text: "fa_arrow_circle_left    "; icon: "\uf0a8"; path: "" }
        ListElement { text: "fa_arrow_circle_o_down  "; icon: "\uf01a"; path: "" }
        ListElement { text: "fa_arrow_circle_o_left  "; icon: "\uf190"; path: "" }
        ListElement { text: "fa_arrow_circle_o_right "; icon: "\uf18e"; path: "" }
        ListElement { text: "fa_arrow_circle_o_up    "; icon: "\uf01b"; path: "" }
        ListElement { text: "fa_arrow_circle_right   "; icon: "\uf0a9"; path: "" }
        ListElement { text: "fa_arrow_circle_up      "; icon: "\uf0aa"; path: "" }
        ListElement { text: "fa_arrow_down           "; icon: "\uf063"; path: "" }
        ListElement { text: "fa_arrow_left           "; icon: "\uf060"; path: "" }
        ListElement { text: "fa_arrow_right          "; icon: "\uf061"; path: "" }
        ListElement { text: "fa_arrow_up             "; icon: "\uf062"; path: "" }
        ListElement { text: "fa_arrows               "; icon: "\uf047"; path: "" }
        ListElement { text: "fa_arrows_alt           "; icon: "\uf0b2"; path: "" }
        ListElement { text: "fa_arrows_h             "; icon: "\uf07e"; path: "" }
        ListElement { text: "fa_arrows_v             "; icon: "\uf07d"; path: "" }
        ListElement { text: "fa_asterisk             "; icon: "\uf069"; path: "" }
        ListElement { text: "fa_automobile           "; icon: "\uf1b9"; path: "" }
        ListElement { text: "fa_backward             "; icon: "\uf04a"; path: "" }
        ListElement { text: "fa_ban                  "; icon: "\uf05e"; path: "" }
        ListElement { text: "fa_bank                 "; icon: "\uf19c"; path: "" }
        ListElement { text: "fa_bar_chart_o          "; icon: "\uf080"; path: "" }
        ListElement { text: "fa_barcode              "; icon: "\uf02a"; path: "" }
        ListElement { text: "fa_bars                 "; icon: "\uf0c9"; path: "" }
        ListElement { text: "fa_beer                 "; icon: "\uf0fc"; path: "" }
        ListElement { text: "fa_behance              "; icon: "\uf1b4"; path: "" }
        ListElement { text: "fa_behance_square       "; icon: "\uf1b5"; path: "" }
        ListElement { text: "fa_bell                 "; icon: "\uf0f3"; path: "" }
        ListElement { text: "fa_bell_o               "; icon: "\uf0a2"; path: "" }
        ListElement { text: "fa_bell_slash_o         "; icon: "\uf1f7"; path: "" }
        ListElement { text: "fa_bitbucket            "; icon: "\uf171"; path: "" }
        ListElement { text: "fa_bitbucket_square     "; icon: "\uf172"; path: "" }
        ListElement { text: "fa_bitcoin              "; icon: "\uf15a"; path: "" }
        ListElement { text: "fa_bold                 "; icon: "\uf032"; path: "" }
        ListElement { text: "fa_bolt                 "; icon: "\uf0e7"; path: "" }
        ListElement { text: "fa_bomb                 "; icon: "\uf1e2"; path: "" }
        ListElement { text: "fa_book                 "; icon: "\uf02d"; path: "" }
        ListElement { text: "fa_bookmark             "; icon: "\uf02e"; path: "" }
        ListElement { text: "fa_bookmark_o           "; icon: "\uf097"; path: "" }
        ListElement { text: "fa_briefcase            "; icon: "\uf0b1"; path: "" }
        ListElement { text: "fa_btc                  "; icon: "\uf15a"; path: "" }
        ListElement { text: "fa_bug                  "; icon: "\uf188"; path: "" }
        ListElement { text: "fa_building             "; icon: "\uf1ad"; path: "" }
        ListElement { text: "fa_building_o           "; icon: "\uf0f7"; path: "" }
        ListElement { text: "fa_bullhorn             "; icon: "\uf0a1"; path: "" }
        ListElement { text: "fa_bullseye             "; icon: "\uf140"; path: "" }
        ListElement { text: "fa_cab                  "; icon: "\uf1ba"; path: "" }
        ListElement { text: "fa_calendar             "; icon: "\uf073"; path: "" }
        ListElement { text: "fa_calendar_o           "; icon: "\uf133"; path: "" }
        ListElement { text: "fa_camera               "; icon: "\uf030"; path: "" }
        ListElement { text: "fa_camera_retro         "; icon: "\uf083"; path: "" }
        ListElement { text: "fa_car                  "; icon: "\uf1b9"; path: "" }
        ListElement { text: "fa_caret_down           "; icon: "\uf0d7"; path: "" }
        ListElement { text: "fa_caret_left           "; icon: "\uf0d9"; path: "" }
        ListElement { text: "fa_caret_right          "; icon: "\uf0da"; path: "" }
        ListElement { text: "fa_caret_square_o_down  "; icon: "\uf150"; path: "" }
        ListElement { text: "fa_caret_square_o_left  "; icon: "\uf191"; path: "" }
        ListElement { text: "fa_caret_square_o_right "; icon: "\uf152"; path: "" }
        ListElement { text: "fa_caret_square_o_up    "; icon: "\uf151"; path: "" }
        ListElement { text: "fa_caret_up             "; icon: "\uf0d8"; path: "" }
        ListElement { text: "fa_certificate          "; icon: "\uf0a3"; path: "" }
        ListElement { text: "fa_chain                "; icon: "\uf0c1"; path: "" }
        ListElement { text: "fa_chain_broken         "; icon: "\uf127"; path: "" }
        ListElement { text: "fa_check                "; icon: "\uf00c"; path: "" }
        ListElement { text: "fa_check_circle         "; icon: "\uf058"; path: "" }
        ListElement { text: "fa_check_circle_o       "; icon: "\uf05d"; path: "" }
        ListElement { text: "fa_check_square         "; icon: "\uf14a"; path: "" }
        ListElement { text: "fa_check_square_o       "; icon: "\uf046"; path: "" }
        ListElement { text: "fa_chevron_circle_down  "; icon: "\uf13a"; path: "" }
        ListElement { text: "fa_chevron_circle_left  "; icon: "\uf137"; path: "" }
        ListElement { text: "fa_chevron_circle_right "; icon: "\uf138"; path: "" }
        ListElement { text: "fa_chevron_circle_up    "; icon: "\uf139"; path: "" }
        ListElement { text: "fa_chevron_down         "; icon: "\uf078"; path: "" }
        ListElement { text: "fa_chevron_left         "; icon: "\uf053"; path: "" }
        ListElement { text: "fa_chevron_right        "; icon: "\uf054"; path: "" }
        ListElement { text: "fa_chevron_up           "; icon: "\uf077"; path: "" }
        ListElement { text: "fa_child                "; icon: "\uf1ae"; path: "" }
        ListElement { text: "fa_circle               "; icon: "\uf111"; path: "" }
        ListElement { text: "fa_circle_o             "; icon: "\uf10c"; path: "" }
        ListElement { text: "fa_circle_o_notch       "; icon: "\uf1ce"; path: "" }
        ListElement { text: "fa_circle_thin          "; icon: "\uf1db"; path: "" }
        ListElement { text: "fa_clipboard            "; icon: "\uf0ea"; path: "" }
        ListElement { text: "fa_clock_o              "; icon: "\uf017"; path: "" }
        ListElement { text: "fa_cloud                "; icon: "\uf0c2"; path: "" }
        ListElement { text: "fa_cloud_download       "; icon: "\uf0ed"; path: "" }
        ListElement { text: "fa_cloud_upload         "; icon: "\uf0ee"; path: "" }
        ListElement { text: "fa_cny                  "; icon: "\uf157"; path: "" }
        ListElement { text: "fa_code                 "; icon: "\uf121"; path: "" }
        ListElement { text: "fa_code_fork            "; icon: "\uf126"; path: "" }
        ListElement { text: "fa_codepen              "; icon: "\uf1cb"; path: "" }
        ListElement { text: "fa_coffee               "; icon: "\uf0f4"; path: "" }
        ListElement { text: "fa_cog                  "; icon: "\uf013"; path: "" }
        ListElement { text: "fa_cogs                 "; icon: "\uf085"; path: "" }
        ListElement { text: "fa_columns              "; icon: "\uf0db"; path: "" }
        ListElement { text: "fa_comment              "; icon: "\uf075"; path: "" }
        ListElement { text: "fa_comment_o            "; icon: "\uf0e5"; path: "" }
        ListElement { text: "fa_comments             "; icon: "\uf086"; path: "" }
        ListElement { text: "fa_comments_o           "; icon: "\uf0e6"; path: "" }
        ListElement { text: "fa_compass              "; icon: "\uf14e"; path: "" }
        ListElement { text: "fa_compress             "; icon: "\uf066"; path: "" }
        ListElement { text: "fa_copy                 "; icon: "\uf0c5"; path: "" }
        ListElement { text: "fa_credit_card          "; icon: "\uf09d"; path: "" }
        ListElement { text: "fa_crop                 "; icon: "\uf125"; path: "" }
        ListElement { text: "fa_crosshairs           "; icon: "\uf05b"; path: "" }
        ListElement { text: "fa_css3                 "; icon: "\uf13c"; path: "" }
        ListElement { text: "fa_cube                 "; icon: "\uf1b2"; path: "" }
        ListElement { text: "fa_cubes                "; icon: "\uf1b3"; path: "" }
        ListElement { text: "fa_cut                  "; icon: "\uf0c4"; path: "" }
        ListElement { text: "fa_cutlery              "; icon: "\uf0f5"; path: "" }
        ListElement { text: "fa_dashboard            "; icon: "\uf0e4"; path: "" }
        ListElement { text: "fa_database             "; icon: "\uf1c0"; path: "" }
        ListElement { text: "fa_dedent               "; icon: "\uf03b"; path: "" }
        ListElement { text: "fa_delicious            "; icon: "\uf1a5"; path: "" }
        ListElement { text: "fa_desktop              "; icon: "\uf108"; path: "" }
        ListElement { text: "fa_deviantart           "; icon: "\uf1bd"; path: "" }
        ListElement { text: "fa_digg                 "; icon: "\uf1a6"; path: "" }
        ListElement { text: "fa_dollar               "; icon: "\uf155"; path: "" }
        ListElement { text: "fa_dot_circle_o         "; icon: "\uf192"; path: "" }
        ListElement { text: "fa_download             "; icon: "\uf019"; path: "" }
        ListElement { text: "fa_dribbble             "; icon: "\uf17d"; path: "" }
        ListElement { text: "fa_dropbox              "; icon: "\uf16b"; path: "" }
        ListElement { text: "fa_drupal               "; icon: "\uf1a9"; path: "" }
        ListElement { text: "fa_edit                 "; icon: "\uf044"; path: "" }
        ListElement { text: "fa_eject                "; icon: "\uf052"; path: "" }
        ListElement { text: "fa_ellipsis_h           "; icon: "\uf141"; path: "" }
        ListElement { text: "fa_ellipsis_v           "; icon: "\uf142"; path: "" }
        ListElement { text: "fa_empire               "; icon: "\uf1d1"; path: "" }
        ListElement { text: "fa_envelope             "; icon: "\uf0e0"; path: "" }
        ListElement { text: "fa_envelope_o           "; icon: "\uf003"; path: "" }
        ListElement { text: "fa_envelope_square      "; icon: "\uf199"; path: "" }
        ListElement { text: "fa_eraser               "; icon: "\uf12d"; path: "" }
        ListElement { text: "fa_eur                  "; icon: "\uf153"; path: "" }
        ListElement { text: "fa_euro                 "; icon: "\uf153"; path: "" }
        ListElement { text: "fa_exchange             "; icon: "\uf0ec"; path: "" }
        ListElement { text: "fa_exclamation          "; icon: "\uf12a"; path: "" }
        ListElement { text: "fa_exclamation_circle   "; icon: "\uf06a"; path: "" }
        ListElement { text: "fa_exclamation_triangle "; icon: "\uf071"; path: "" }
        ListElement { text: "fa_expand               "; icon: "\uf065"; path: "" }
        ListElement { text: "fa_external_link        "; icon: "\uf08e"; path: "" }
        ListElement { text: "fa_external_link_square "; icon: "\uf14c"; path: "" }
        ListElement { text: "fa_eye                  "; icon: "\uf06e"; path: "" }
        ListElement { text: "fa_eye_slash            "; icon: "\uf070"; path: "" }
        ListElement { text: "fa_facebook             "; icon: "\uf09a"; path: "" }
        ListElement { text: "fa_facebook_square      "; icon: "\uf082"; path: "" }
        ListElement { text: "fa_fast_backward        "; icon: "\uf049"; path: "" }
        ListElement { text: "fa_fast_forward         "; icon: "\uf050"; path: "" }
        ListElement { text: "fa_fax                  "; icon: "\uf1ac"; path: "" }
        ListElement { text: "fa_female               "; icon: "\uf182"; path: "" }
        ListElement { text: "fa_fighter_jet          "; icon: "\uf0fb"; path: "" }
        ListElement { text: "fa_file                 "; icon: "\uf15b"; path: "" }
        ListElement { text: "fa_file_archive_o       "; icon: "\uf1c6"; path: "" }
        ListElement { text: "fa_file_audio_o         "; icon: "\uf1c7"; path: "" }
        ListElement { text: "fa_file_code_o          "; icon: "\uf1c9"; path: "" }
        ListElement { text: "fa_file_excel_o         "; icon: "\uf1c3"; path: "" }
        ListElement { text: "fa_file_image_o         "; icon: "\uf1c5"; path: "" }
        ListElement { text: "fa_file_movie_o         "; icon: "\uf1c8"; path: "" }
        ListElement { text: "fa_file_o               "; icon: "\uf016"; path: "" }
        ListElement { text: "fa_file_pdf_o           "; icon: "\uf1c1"; path: "" }
        ListElement { text: "fa_file_photo_o         "; icon: "\uf1c5"; path: "" }
        ListElement { text: "fa_file_picture_o       "; icon: "\uf1c5"; path: "" }
        ListElement { text: "fa_file_powerpoint_o    "; icon: "\uf1c4"; path: "" }
        ListElement { text: "fa_file_sound_o         "; icon: "\uf1c7"; path: "" }
        ListElement { text: "fa_file_text            "; icon: "\uf15c"; path: "" }
        ListElement { text: "fa_file_text_o          "; icon: "\uf0f6"; path: "" }
        ListElement { text: "fa_file_video_o         "; icon: "\uf1c8"; path: "" }
        ListElement { text: "fa_file_word_o          "; icon: "\uf1c2"; path: "" }
        ListElement { text: "fa_file_zip_o           "; icon: "\uf1c6"; path: "" }
        ListElement { text: "fa_files_o              "; icon: "\uf0c5"; path: "" }
        ListElement { text: "fa_film                 "; icon: "\uf008"; path: "" }
        ListElement { text: "fa_filter               "; icon: "\uf0b0"; path: "" }
        ListElement { text: "fa_fire                 "; icon: "\uf06d"; path: "" }
        ListElement { text: "fa_fire_extinguisher    "; icon: "\uf134"; path: "" }
        ListElement { text: "fa_flag                 "; icon: "\uf024"; path: "" }
        ListElement { text: "fa_flag_checkered       "; icon: "\uf11e"; path: "" }
        ListElement { text: "fa_flag_o               "; icon: "\uf11d"; path: "" }
        ListElement { text: "fa_flash                "; icon: "\uf0e7"; path: "" }
        ListElement { text: "fa_flask                "; icon: "\uf0c3"; path: "" }
        ListElement { text: "fa_flickr               "; icon: "\uf16e"; path: "" }
        ListElement { text: "fa_floppy_o             "; icon: "\uf0c7"; path: "" }
        ListElement { text: "fa_folder               "; icon: "\uf07b"; path: "" }
        ListElement { text: "fa_folder_o             "; icon: "\uf114"; path: "" }
        ListElement { text: "fa_folder_open          "; icon: "\uf07c"; path: "" }
        ListElement { text: "fa_folder_open_o        "; icon: "\uf115"; path: "" }
        ListElement { text: "fa_font                 "; icon: "\uf031"; path: "" }
        ListElement { text: "fa_forward              "; icon: "\uf04e"; path: "" }
        ListElement { text: "fa_foursquare           "; icon: "\uf180"; path: "" }
        ListElement { text: "fa_frown_o              "; icon: "\uf119"; path: "" }
        ListElement { text: "fa_gamepad              "; icon: "\uf11b"; path: "" }
        ListElement { text: "fa_gavel                "; icon: "\uf0e3"; path: "" }
        ListElement { text: "fa_gbp                  "; icon: "\uf154"; path: "" }
        ListElement { text: "fa_ge                   "; icon: "\uf1d1"; path: "" }
        ListElement { text: "fa_gear                 "; icon: "\uf013"; path: "" }
        ListElement { text: "fa_gears                "; icon: "\uf085"; path: "" }
        ListElement { text: "fa_gift                 "; icon: "\uf06b"; path: "" }
        ListElement { text: "fa_git                  "; icon: "\uf1d3"; path: "" }
        ListElement { text: "fa_git_square           "; icon: "\uf1d2"; path: "" }
        ListElement { text: "fa_github               "; icon: "\uf09b"; path: "" }
        ListElement { text: "fa_github_alt           "; icon: "\uf113"; path: "" }
        ListElement { text: "fa_github_square        "; icon: "\uf092"; path: "" }
        ListElement { text: "fa_gittip               "; icon: "\uf184"; path: "" }
        ListElement { text: "fa_glass                "; icon: "\uf000"; path: "" }
        ListElement { text: "fa_globe                "; icon: "\uf0ac"; path: "" }
        ListElement { text: "fa_google               "; icon: "\uf1a0"; path: "" }
        ListElement { text: "fa_google_plus          "; icon: "\uf0d5"; path: "" }
        ListElement { text: "fa_google_plus_square   "; icon: "\uf0d4"; path: "" }
        ListElement { text: "fa_graduation_cap       "; icon: "\uf19d"; path: "" }
        ListElement { text: "fa_group                "; icon: "\uf0c0"; path: "" }
        ListElement { text: "fa_h_square             "; icon: "\uf0fd"; path: "" }
        ListElement { text: "fa_hacker_news          "; icon: "\uf1d4"; path: "" }
        ListElement { text: "fa_hand_o_down          "; icon: "\uf0a7"; path: "" }
        ListElement { text: "fa_hand_o_left          "; icon: "\uf0a5"; path: "" }
        ListElement { text: "fa_hand_o_right         "; icon: "\uf0a4"; path: "" }
        ListElement { text: "fa_hand_o_up            "; icon: "\uf0a6"; path: "" }
        ListElement { text: "fa_hdd_o                "; icon: "\uf0a0"; path: "" }
        ListElement { text: "fa_header               "; icon: "\uf1dc"; path: "" }
        ListElement { text: "fa_headphones           "; icon: "\uf025"; path: "" }
        ListElement { text: "fa_heart                "; icon: "\uf004"; path: "" }
        ListElement { text: "fa_heart_o              "; icon: "\uf08a"; path: "" }
        ListElement { text: "fa_history              "; icon: "\uf1da"; path: "" }
        ListElement { text: "fa_home                 "; icon: "\uf015"; path: "" }
        ListElement { text: "fa_hospital_o           "; icon: "\uf0f8"; path: "" }
        ListElement { text: "fa_html5                "; icon: "\uf13b"; path: "" }
        ListElement { text: "fa_image                "; icon: "\uf03e"; path: "" }
        ListElement { text: "fa_inbox                "; icon: "\uf01c"; path: "" }
        ListElement { text: "fa_indent               "; icon: "\uf03c"; path: "" }
        ListElement { text: "fa_info                 "; icon: "\uf129"; path: "" }
        ListElement { text: "fa_info_circle          "; icon: "\uf05a"; path: "" }
        ListElement { text: "fa_inr                  "; icon: "\uf156"; path: "" }
        ListElement { text: "fa_instagram            "; icon: "\uf16d"; path: "" }
        ListElement { text: "fa_institution          "; icon: "\uf19c"; path: "" }
        ListElement { text: "fa_italic               "; icon: "\uf033"; path: "" }
        ListElement { text: "fa_joomla               "; icon: "\uf1aa"; path: "" }
        ListElement { text: "fa_jpy                  "; icon: "\uf157"; path: "" }
        ListElement { text: "fa_jsfiddle             "; icon: "\uf1cc"; path: "" }
        ListElement { text: "fa_key                  "; icon: "\uf084"; path: "" }
        ListElement { text: "fa_keyboard_o           "; icon: "\uf11c"; path: "" }
        ListElement { text: "fa_krw                  "; icon: "\uf159"; path: "" }
        ListElement { text: "fa_language             "; icon: "\uf1ab"; path: "" }
        ListElement { text: "fa_laptop               "; icon: "\uf109"; path: "" }
        ListElement { text: "fa_leaf                 "; icon: "\uf06c"; path: "" }
        ListElement { text: "fa_legal                "; icon: "\uf0e3"; path: "" }
        ListElement { text: "fa_lemon_o              "; icon: "\uf094"; path: "" }
        ListElement { text: "fa_level_down           "; icon: "\uf149"; path: "" }
        ListElement { text: "fa_level_up             "; icon: "\uf148"; path: "" }
        ListElement { text: "fa_life_bouy            "; icon: "\uf1cd"; path: "" }
        ListElement { text: "fa_life_ring            "; icon: "\uf1cd"; path: "" }
        ListElement { text: "fa_life_saver           "; icon: "\uf1cd"; path: "" }
        ListElement { text: "fa_lightbulb_o          "; icon: "\uf0eb"; path: "" }
        ListElement { text: "fa_link                 "; icon: "\uf0c1"; path: "" }
        ListElement { text: "fa_linkedin             "; icon: "\uf0e1"; path: "" }
        ListElement { text: "fa_linkedin_square      "; icon: "\uf08c"; path: "" }
        ListElement { text: "fa_linux                "; icon: "\uf17c"; path: "" }
        ListElement { text: "fa_list                 "; icon: "\uf03a"; path: "" }
        ListElement { text: "fa_list_alt             "; icon: "\uf022"; path: "" }
        ListElement { text: "fa_list_ol              "; icon: "\uf0cb"; path: "" }
        ListElement { text: "fa_list_ul              "; icon: "\uf0ca"; path: "" }
        ListElement { text: "fa_location_arrow       "; icon: "\uf124"; path: "" }
        ListElement { text: "fa_lock                 "; icon: "\uf023"; path: "" }
        ListElement { text: "fa_long_arrow_down      "; icon: "\uf175"; path: "" }
        ListElement { text: "fa_long_arrow_left      "; icon: "\uf177"; path: "" }
        ListElement { text: "fa_long_arrow_right     "; icon: "\uf178"; path: "" }
        ListElement { text: "fa_long_arrow_up        "; icon: "\uf176"; path: "" }
        ListElement { text: "fa_magic                "; icon: "\uf0d0"; path: "" }
        ListElement { text: "fa_magnet               "; icon: "\uf076"; path: "" }
        ListElement { text: "fa_mail_forward         "; icon: "\uf064"; path: "" }
        ListElement { text: "fa_mail_reply           "; icon: "\uf112"; path: "" }
        ListElement { text: "fa_mail_reply_all       "; icon: "\uf122"; path: "" }
        ListElement { text: "fa_male                 "; icon: "\uf183"; path: "" }
        ListElement { text: "fa_map_marker           "; icon: "\uf041"; path: "" }
        ListElement { text: "fa_maxcdn               "; icon: "\uf136"; path: "" }
        ListElement { text: "fa_medkit               "; icon: "\uf0fa"; path: "" }
        ListElement { text: "fa_meh_o                "; icon: "\uf11a"; path: "" }
        ListElement { text: "fa_microphone           "; icon: "\uf130"; path: "" }
        ListElement { text: "fa_microphone_slash     "; icon: "\uf131"; path: "" }
        ListElement { text: "fa_minus                "; icon: "\uf068"; path: "" }
        ListElement { text: "fa_minus_circle         "; icon: "\uf056"; path: "" }
        ListElement { text: "fa_minus_square         "; icon: "\uf146"; path: "" }
        ListElement { text: "fa_minus_square_o       "; icon: "\uf147"; path: "" }
        ListElement { text: "fa_mobile               "; icon: "\uf10b"; path: "" }
        ListElement { text: "fa_mobile_phone         "; icon: "\uf10b"; path: "" }
        ListElement { text: "fa_money                "; icon: "\uf0d6"; path: "" }
        ListElement { text: "fa_moon_o               "; icon: "\uf186"; path: "" }
        ListElement { text: "fa_mortar_board         "; icon: "\uf19d"; path: "" }
        ListElement { text: "fa_music                "; icon: "\uf001"; path: "" }
        ListElement { text: "fa_navicon              "; icon: "\uf0c9"; path: "" }
        ListElement { text: "fa_openid               "; icon: "\uf19b"; path: "" }
        ListElement { text: "fa_outdent              "; icon: "\uf03b"; path: "" }
        ListElement { text: "fa_pagelines            "; icon: "\uf18c"; path: "" }
        ListElement { text: "fa_paper_plane          "; icon: "\uf1d8"; path: "" }
        ListElement { text: "fa_paper_plane_o        "; icon: "\uf1d9"; path: "" }
        ListElement { text: "fa_paperclip            "; icon: "\uf0c6"; path: "" }
        ListElement { text: "fa_paragraph            "; icon: "\uf1dd"; path: "" }
        ListElement { text: "fa_paste                "; icon: "\uf0ea"; path: "" }
        ListElement { text: "fa_pause                "; icon: "\uf04c"; path: "" }
        ListElement { text: "fa_paw                  "; icon: "\uf1b0"; path: "" }
        ListElement { text: "fa_pencil               "; icon: "\uf040"; path: "" }
        ListElement { text: "fa_pencil_square        "; icon: "\uf14b"; path: "" }
        ListElement { text: "fa_pencil_square_o      "; icon: "\uf044"; path: "" }
        ListElement { text: "fa_phone                "; icon: "\uf095"; path: "" }
        ListElement { text: "fa_phone_square         "; icon: "\uf098"; path: "" }
        ListElement { text: "fa_photo                "; icon: "\uf03e"; path: "" }
        ListElement { text: "fa_picture_o            "; icon: "\uf03e"; path: "" }
        ListElement { text: "fa_pied_piper           "; icon: "\uf1a7"; path: "" }
        ListElement { text: "fa_pied_piper_alt       "; icon: "\uf1a8"; path: "" }
        ListElement { text: "fa_pied_piper_square    "; icon: "\uf1a7"; path: "" }
        ListElement { text: "fa_pinterest            "; icon: "\uf0d2"; path: "" }
        ListElement { text: "fa_pinterest_square     "; icon: "\uf0d3"; path: "" }
        ListElement { text: "fa_plane                "; icon: "\uf072"; path: "" }
        ListElement { text: "fa_play                 "; icon: "\uf04b"; path: "" }
        ListElement { text: "fa_play_circle          "; icon: "\uf144"; path: "" }
        ListElement { text: "fa_play_circle_o        "; icon: "\uf01d"; path: "" }
        ListElement { text: "fa_plus                 "; icon: "\uf067"; path: "" }
        ListElement { text: "fa_plus_circle          "; icon: "\uf055"; path: "" }
        ListElement { text: "fa_plus_square          "; icon: "\uf0fe"; path: "" }
        ListElement { text: "fa_plus_square_o        "; icon: "\uf196"; path: "" }
        ListElement { text: "fa_power_off            "; icon: "\uf011"; path: "" }
        ListElement { text: "fa_print                "; icon: "\uf02f"; path: "" }
        ListElement { text: "fa_puzzle_piece         "; icon: "\uf12e"; path: "" }
        ListElement { text: "fa_qq                   "; icon: "\uf1d6"; path: "" }
        ListElement { text: "fa_qrcode               "; icon: "\uf029"; path: "" }
        ListElement { text: "fa_question             "; icon: "\uf128"; path: "" }
        ListElement { text: "fa_question_circle      "; icon: "\uf059"; path: "" }
        ListElement { text: "fa_quote_left           "; icon: "\uf10d"; path: "" }
        ListElement { text: "fa_quote_right          "; icon: "\uf10e"; path: "" }
        ListElement { text: "fa_ra                   "; icon: "\uf1d0"; path: "" }
        ListElement { text: "fa_random               "; icon: "\uf074"; path: "" }
        ListElement { text: "fa_rebel                "; icon: "\uf1d0"; path: "" }
        ListElement { text: "fa_recycle              "; icon: "\uf1b8"; path: "" }
        ListElement { text: "fa_reddit               "; icon: "\uf1a1"; path: "" }
        ListElement { text: "fa_reddit_square        "; icon: "\uf1a2"; path: "" }
        ListElement { text: "fa_refresh              "; icon: "\uf021"; path: "" }
        ListElement { text: "fa_renren               "; icon: "\uf18b"; path: "" }
        ListElement { text: "fa_reorder              "; icon: "\uf0c9"; path: "" }
        ListElement { text: "fa_repeat               "; icon: "\uf01e"; path: "" }
        ListElement { text: "fa_reply                "; icon: "\uf112"; path: "" }
        ListElement { text: "fa_reply_all            "; icon: "\uf122"; path: "" }
        ListElement { text: "fa_retweet              "; icon: "\uf079"; path: "" }
        ListElement { text: "fa_rmb                  "; icon: "\uf157"; path: "" }
        ListElement { text: "fa_road                 "; icon: "\uf018"; path: "" }
        ListElement { text: "fa_rocket               "; icon: "\uf135"; path: "" }
        ListElement { text: "fa_rotate_left          "; icon: "\uf0e2"; path: "" }
        ListElement { text: "fa_rotate_right         "; icon: "\uf01e"; path: "" }
        ListElement { text: "fa_rouble               "; icon: "\uf158"; path: "" }
        ListElement { text: "fa_rss                  "; icon: "\uf09e"; path: "" }
        ListElement { text: "fa_rss_square           "; icon: "\uf143"; path: "" }
        ListElement { text: "fa_rub                  "; icon: "\uf158"; path: "" }
        ListElement { text: "fa_ruble                "; icon: "\uf158"; path: "" }
        ListElement { text: "fa_rupee                "; icon: "\uf156"; path: "" }
        ListElement { text: "fa_save                 "; icon: "\uf0c7"; path: "" }
        ListElement { text: "fa_scissors             "; icon: "\uf0c4"; path: "" }
        ListElement { text: "fa_search               "; icon: "\uf002"; path: "" }
        ListElement { text: "fa_search_minus         "; icon: "\uf010"; path: "" }
        ListElement { text: "fa_search_plus          "; icon: "\uf00e"; path: "" }
        ListElement { text: "fa_send                 "; icon: "\uf1d8"; path: "" }
        ListElement { text: "fa_send_o               "; icon: "\uf1d9"; path: "" }
        ListElement { text: "fa_share                "; icon: "\uf064"; path: "" }
        ListElement { text: "fa_share_alt            "; icon: "\uf1e0"; path: "" }
        ListElement { text: "fa_share_alt_square     "; icon: "\uf1e1"; path: "" }
        ListElement { text: "fa_share_square         "; icon: "\uf14d"; path: "" }
        ListElement { text: "fa_share_square_o       "; icon: "\uf045"; path: "" }
        ListElement { text: "fa_shield               "; icon: "\uf132"; path: "" }
        ListElement { text: "fa_shopping_cart        "; icon: "\uf07a"; path: "" }
        ListElement { text: "fa_sign_in              "; icon: "\uf090"; path: "" }
        ListElement { text: "fa_sign_out             "; icon: "\uf08b"; path: "" }
        ListElement { text: "fa_signal               "; icon: "\uf012"; path: "" }
        ListElement { text: "fa_sitemap              "; icon: "\uf0e8"; path: "" }
        ListElement { text: "fa_skype                "; icon: "\uf17e"; path: "" }
        ListElement { text: "fa_slack                "; icon: "\uf198"; path: "" }
        ListElement { text: "fa_sliders              "; icon: "\uf1de"; path: "" }
        ListElement { text: "fa_smile_o              "; icon: "\uf118"; path: "" }
        ListElement { text: "fa_sort                 "; icon: "\uf0dc"; path: "" }
        ListElement { text: "fa_sort_alpha_asc       "; icon: "\uf15d"; path: "" }
        ListElement { text: "fa_sort_alpha_desc      "; icon: "\uf15e"; path: "" }
        ListElement { text: "fa_sort_amount_asc      "; icon: "\uf160"; path: "" }
        ListElement { text: "fa_sort_amount_desc     "; icon: "\uf161"; path: "" }
        ListElement { text: "fa_sort_asc             "; icon: "\uf0de"; path: "" }
        ListElement { text: "fa_sort_desc            "; icon: "\uf0dd"; path: "" }
        ListElement { text: "fa_sort_down            "; icon: "\uf0dd"; path: "" }
        ListElement { text: "fa_sort_numeric_asc     "; icon: "\uf162"; path: "" }
        ListElement { text: "fa_sort_numeric_desc    "; icon: "\uf163"; path: "" }
        ListElement { text: "fa_sort_up              "; icon: "\uf0de"; path: "" }
        ListElement { text: "fa_soundcloud           "; icon: "\uf1be"; path: "" }
        ListElement { text: "fa_space_shuttle        "; icon: "\uf197"; path: "" }
        ListElement { text: "fa_spinner              "; icon: "\uf110"; path: "" }
        ListElement { text: "fa_spoon                "; icon: "\uf1b1"; path: "" }
        ListElement { text: "fa_spotify              "; icon: "\uf1bc"; path: "" }
        ListElement { text: "fa_square               "; icon: "\uf0c8"; path: "" }
        ListElement { text: "fa_square_o             "; icon: "\uf096"; path: "" }
        ListElement { text: "fa_stack_exchange       "; icon: "\uf18d"; path: "" }
        ListElement { text: "fa_stack_overflow       "; icon: "\uf16c"; path: "" }
        ListElement { text: "fa_star                 "; icon: "\uf005"; path: "" }
        ListElement { text: "fa_star_half            "; icon: "\uf089"; path: "" }
        ListElement { text: "fa_star_half_empty      "; icon: "\uf123"; path: "" }
        ListElement { text: "fa_star_half_full       "; icon: "\uf123"; path: "" }
        ListElement { text: "fa_star_half_o          "; icon: "\uf123"; path: "" }
        ListElement { text: "fa_star_o               "; icon: "\uf006"; path: "" }
        ListElement { text: "fa_steam                "; icon: "\uf1b6"; path: "" }
        ListElement { text: "fa_steam_square         "; icon: "\uf1b7"; path: "" }
        ListElement { text: "fa_step_backward        "; icon: "\uf048"; path: "" }
        ListElement { text: "fa_step_forward         "; icon: "\uf051"; path: "" }
        ListElement { text: "fa_stethoscope          "; icon: "\uf0f1"; path: "" }
        ListElement { text: "fa_stop                 "; icon: "\uf04d"; path: "" }
        ListElement { text: "fa_strikethrough        "; icon: "\uf0cc"; path: "" }
        ListElement { text: "fa_stumbleupon          "; icon: "\uf1a4"; path: "" }
        ListElement { text: "fa_stumbleupon_circle   "; icon: "\uf1a3"; path: "" }
        ListElement { text: "fa_subscript            "; icon: "\uf12c"; path: "" }
        ListElement { text: "fa_suitcase             "; icon: "\uf0f2"; path: "" }
        ListElement { text: "fa_sun_o                "; icon: "\uf185"; path: "" }
        ListElement { text: "fa_superscript          "; icon: "\uf12b"; path: "" }
        ListElement { text: "fa_support              "; icon: "\uf1cd"; path: "" }
        ListElement { text: "fa_table                "; icon: "\uf0ce"; path: "" }
        ListElement { text: "fa_tablet               "; icon: "\uf10a"; path: "" }
        ListElement { text: "fa_tachometer           "; icon: "\uf0e4"; path: "" }
        ListElement { text: "fa_tag                  "; icon: "\uf02b"; path: "" }
        ListElement { text: "fa_tags                 "; icon: "\uf02c"; path: "" }
        ListElement { text: "fa_tasks                "; icon: "\uf0ae"; path: "" }
        ListElement { text: "fa_taxi                 "; icon: "\uf1ba"; path: "" }
        ListElement { text: "fa_tencent_weibo        "; icon: "\uf1d5"; path: "" }
        ListElement { text: "fa_terminal             "; icon: "\uf120"; path: "" }
        ListElement { text: "fa_text_height          "; icon: "\uf034"; path: "" }
        ListElement { text: "fa_text_width           "; icon: "\uf035"; path: "" }
        ListElement { text: "fa_th                   "; icon: "\uf00a"; path: "" }
        ListElement { text: "fa_th_large             "; icon: "\uf009"; path: "" }
        ListElement { text: "fa_th_list              "; icon: "\uf00b"; path: "" }
        ListElement { text: "fa_thumb_tack           "; icon: "\uf08d"; path: "" }
        ListElement { text: "fa_thumbs_down          "; icon: "\uf165"; path: "" }
        ListElement { text: "fa_thumbs_o_down        "; icon: "\uf088"; path: "" }
        ListElement { text: "fa_thumbs_o_up          "; icon: "\uf087"; path: "" }
        ListElement { text: "fa_thumbs_up            "; icon: "\uf164"; path: "" }
        ListElement { text: "fa_ticket               "; icon: "\uf145"; path: "" }
        ListElement { text: "fa_times                "; icon: "\uf00d"; path: "" }
        ListElement { text: "fa_times_circle         "; icon: "\uf057"; path: "" }
        ListElement { text: "fa_times_circle_o       "; icon: "\uf05c"; path: "" }
        ListElement { text: "fa_tint                 "; icon: "\uf043"; path: "" }
        ListElement { text: "fa_toggle_down          "; icon: "\uf150"; path: "" }
        ListElement { text: "fa_toggle_left          "; icon: "\uf191"; path: "" }
        ListElement { text: "fa_toggle_right         "; icon: "\uf152"; path: "" }
        ListElement { text: "fa_toggle_up            "; icon: "\uf151"; path: "" }
        ListElement { text: "fa_trash_o              "; icon: "\uf014"; path: "" }
        ListElement { text: "fa_tree                 "; icon: "\uf1bb"; path: "" }
        ListElement { text: "fa_trello               "; icon: "\uf181"; path: "" }
        ListElement { text: "fa_trophy               "; icon: "\uf091"; path: "" }
        ListElement { text: "fa_truck                "; icon: "\uf0d1"; path: "" }
        ListElement { text: "fa_try                  "; icon: "\uf195"; path: "" }
        ListElement { text: "fa_tumblr               "; icon: "\uf173"; path: "" }
        ListElement { text: "fa_tumblr_square        "; icon: "\uf174"; path: "" }
        ListElement { text: "fa_turkish_lira         "; icon: "\uf195"; path: "" }
        ListElement { text: "fa_twitter              "; icon: "\uf099"; path: "" }
        ListElement { text: "fa_twitter_square       "; icon: "\uf081"; path: "" }
        ListElement { text: "fa_umbrella             "; icon: "\uf0e9"; path: "" }
        ListElement { text: "fa_underline            "; icon: "\uf0cd"; path: "" }
        ListElement { text: "fa_undo                 "; icon: "\uf0e2"; path: "" }
        ListElement { text: "fa_university           "; icon: "\uf19c"; path: "" }
        ListElement { text: "fa_unlink               "; icon: "\uf127"; path: "" }
        ListElement { text: "fa_unlock               "; icon: "\uf09c"; path: "" }
        ListElement { text: "fa_unlock_alt           "; icon: "\uf13e"; path: "" }
        ListElement { text: "fa_unsorted             "; icon: "\uf0dc"; path: "" }
        ListElement { text: "fa_upload               "; icon: "\uf093"; path: "" }
        ListElement { text: "fa_usd                  "; icon: "\uf155"; path: "" }
        ListElement { text: "fa_user                 "; icon: "\uf007"; path: "" }
        ListElement { text: "fa_user_md              "; icon: "\uf0f0"; path: "" }
        ListElement { text: "fa_users                "; icon: "\uf0c0"; path: "" }
        ListElement { text: "fa_video_camera         "; icon: "\uf03d"; path: "" }
        ListElement { text: "fa_vimeo_square         "; icon: "\uf194"; path: "" }
        ListElement { text: "fa_vine                 "; icon: "\uf1ca"; path: "" }
        ListElement { text: "fa_vk                   "; icon: "\uf189"; path: "" }
        ListElement { text: "fa_volume_down          "; icon: "\uf027"; path: "" }
        ListElement { text: "fa_volume_off           "; icon: "\uf026"; path: "" }
        ListElement { text: "fa_volume_up            "; icon: "\uf028"; path: "" }
        ListElement { text: "fa_warning              "; icon: "\uf071"; path: "" }
        ListElement { text: "fa_wechat               "; icon: "\uf1d7"; path: "" }
        ListElement { text: "fa_weibo                "; icon: "\uf18a"; path: "" }
        ListElement { text: "fa_weixin               "; icon: "\uf1d7"; path: "" }
        ListElement { text: "fa_wheelchair           "; icon: "\uf193"; path: "" }
        ListElement { text: "fa_windows              "; icon: "\uf17a"; path: "" }
        ListElement { text: "fa_won                  "; icon: "\uf159"; path: "" }
        ListElement { text: "fa_wordpress            "; icon: "\uf19a"; path: "" }
        ListElement { text: "fa_wrench               "; icon: "\uf0ad"; path: "" }
        ListElement { text: "fa_xing                 "; icon: "\uf168"; path: "" }
        ListElement { text: "fa_xing_square          "; icon: "\uf169"; path: "" }
        ListElement { text: "fa_yahoo                "; icon: "\uf19e"; path: "" }
        ListElement { text: "fa_yen                  "; icon: "\uf157"; path: "" }
        ListElement { text: "fa_youtube              "; icon: "\uf167"; path: "" }
        ListElement { text: "fa_youtube_play         "; icon: "\uf16a"; path: "" }
        ListElement { text: "fa_youtube_square       "; icon: "\uf166"; path: "" }
    }
}
