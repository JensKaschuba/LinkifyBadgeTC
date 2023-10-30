prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- Oracle APEX export file
--
-- You should run this script using a SQL client connected to the database as
-- the owner (parsing schema) of the application or as a database user with the
-- APEX_ADMINISTRATOR_ROLE role.
--
-- This export file has been automatically generated. Modifying this file is not
-- supported by Oracle and can lead to unexpected application and/or instance
-- behavior now or in the future.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_imp.import_begin (
 p_version_yyyy_mm_dd=>'2023.04.28'
,p_release=>'23.1.5'
,p_default_workspace_id=>1037810529053900
,p_default_application_id=>380
,p_default_id_offset=>5400536390497364
,p_default_owner=>'SRRS'
);
end;
/
 
prompt APPLICATION 380 - SRRS v8
--
-- Application Export:
--   Application:     380
--   Name:            SRRS v8
--   Date and Time:   07:55 Montag Oktober 30, 2023
--   Exported By:     ADMIN
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     PLUGIN: 54067920342731313
--   Manifest End
--   Version:         23.1.5
--   Instance ID:     2600108574266392
--

begin
  -- replace components
  wwv_flow_imp.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/template_component/de_kaschuba_linkifybadgetc
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(54067920342731313)
,p_plugin_type=>'TEMPLATE COMPONENT'
,p_theme_id=>nvl(wwv_flow_application_install.get_theme_id, '')
,p_name=>'DE.KASCHUBA.LINKIFYBADGETC'
,p_display_name=>'LinkifyBadgeTC'
,p_supported_component_types=>'PARTIAL:REPORT'
,p_partial_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{if APEX$IS_LAZY_LOADING/}',
'  <span class="t-Badge is-placeholder{if ?SIZE/} #SIZE!ATTR#{endif/}{if ?SHAPE/} #SHAPE!ATTR#{endif/}"></span>',
'{else/}',
'    {if LINK/}',
'        <a href="#LINK!ATTR#" #LINK_ATTR!RAW#">',
'    {endif/}',
'        <span class="t-Badge {if ?STATE/}t-Badge--#STATE!ATTR#{endif/} {if ?STYLE/}#STYLE!ATTR#{endif/} {if ?SIZE/}#SIZE!ATTR#{endif/} {if ?SHAPE/}#SHAPE!ATTR#{endif/}" role="status" aria-label="#LABEL!ATTR# #VALUE!ATTR#" title="#LABEL!ATTR# #VALUE!A'
||'TTR#">',
'            {case ICON_POSITION/}',
'            {when L/}',
'                {if ?ICON/}<span class="t-Badge-icon #ICON!ATTR#" aria-hidden="true"></span>{endif/}',
'            {endcase/}',
'                {if LABEL/}<span class="t-Badge-label">#LABEL!RAW#</span>{endif/}',
'                <span class="t-Badge-value">#VALUE!RAW#</span>',
'            {case ICON_POSITION/}',
'            {when R/}',
'                {if ?ICON/}<span class="t-Badge-icon #ICON!ATTR#" aria-hidden="true"></span>{endif/}',
'            {endcase/}                            ',
'        </span>    ',
'    {if LINK/}',
'        </a>',
'    {endif/}',
'{endif/}',
''))
,p_default_escape_mode=>'HTML'
,p_translate_this_template=>true
,p_api_version=>2
,p_report_body_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{if !APEX$HAS_MESSAGE/}',
'  <ul class="t-Badges #APEX$COMPONENT_CSS_CLASSES#">#APEX$ROWS#</ul>',
'{endif/}'))
,p_report_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Badges-item" #APEX$ROW_IDENTIFICATION#>#APEX$PARTIAL#</li>',
''))
,p_report_placeholder_count=>1
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>'Display content within a badge. A link can be added additionally. Available for multiple report rows or a single row.'
,p_version_identifier=>'1.0'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(54068138567731326)
,p_plugin_id=>wwv_flow_imp.id(54067920342731313)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>30
,p_static_id=>'LABEL'
,p_prompt=>'Label'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_escape_mode=>'STRIPHTML'
,p_is_translatable=>true
,p_help_text=>'Enter a value for the badge label or select a source column from the quick pick options.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(54068542211731328)
,p_plugin_id=>wwv_flow_imp.id(54067920342731313)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>10
,p_static_id=>'VALUE'
,p_prompt=>'Value'
,p_attribute_type=>'SESSION STATE VALUE'
,p_is_required=>true
,p_escape_mode=>'STRIPHTML'
,p_column_data_types=>'VARCHAR2:NUMBER:DATE:INTERVAL_Y2M:INTERVAL_D2S'
,p_is_translatable=>false
,p_help_text=>'Select a source column for the badge value.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(54068955449731328)
,p_plugin_id=>wwv_flow_imp.id(54067920342731313)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>50
,p_static_id=>'STATE'
,p_prompt=>'State'
,p_attribute_type=>'SESSION STATE VALUE'
,p_is_required=>false
,p_escape_mode=>'ATTR'
,p_column_data_types=>'VARCHAR2'
,p_is_translatable=>false
,p_help_text=>'Select the source column for the state of the badge. Substitute column value with "danger", "warning", "success" or "info" for default styling.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(54069351140731328)
,p_plugin_id=>wwv_flow_imp.id(54067920342731313)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_static_id=>'ICON'
,p_prompt=>'Icon'
,p_attribute_type=>'ICON'
,p_is_required=>false
,p_escape_mode=>'ATTR'
,p_is_translatable=>false
,p_help_text=>'Enter an icon class or use the Pick Icon dialog to select the icon you want to add to display in the badge.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(54070159680731329)
,p_plugin_id=>wwv_flow_imp.id(54067920342731313)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_static_id=>'STYLE'
,p_prompt=>'Style'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_escape_mode=>'ATTR'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_null_text=>'Default'
,p_help_text=>'Select the badge style. Default inherits the style set by the containing template.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(54070563860731329)
,p_plugin_attribute_id=>wwv_flow_imp.id(54070159680731329)
,p_display_sequence=>10
,p_display_value=>'Subtle'
,p_return_value=>'t-Badge--subtle'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(54071115158731329)
,p_plugin_attribute_id=>wwv_flow_imp.id(54070159680731329)
,p_display_sequence=>20
,p_display_value=>'Outline'
,p_return_value=>'t-Badge--outline'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(54071558039731329)
,p_plugin_id=>wwv_flow_imp.id(54067920342731313)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_static_id=>'SHAPE'
,p_prompt=>'Shape'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_escape_mode=>'ATTR'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_null_text=>'Default'
,p_help_text=>'Select the shape of the badge. Default inherits the shape set by the containing template.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(54071993747731329)
,p_plugin_attribute_id=>wwv_flow_imp.id(54071558039731329)
,p_display_sequence=>10
,p_display_value=>'Rounded'
,p_return_value=>'t-Badge--rounded'
,p_help_text=>'Displayed with rounded corners.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(54072479185731329)
,p_plugin_attribute_id=>wwv_flow_imp.id(54071558039731329)
,p_display_sequence=>20
,p_display_value=>'Circular'
,p_return_value=>'t-Badge--circle'
,p_help_text=>'Displayed with circular edges.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(54072999685731329)
,p_plugin_attribute_id=>wwv_flow_imp.id(54071558039731329)
,p_display_sequence=>30
,p_display_value=>'Square'
,p_return_value=>'t-Badge--square'
,p_help_text=>'Displayed with squared edges.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(54073476089731330)
,p_plugin_id=>wwv_flow_imp.id(54067920342731313)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_static_id=>'SIZE'
,p_prompt=>'Size'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_escape_mode=>'ATTR'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_null_text=>'Default'
,p_help_text=>'Set the size of the badge. The default inherits the sizing set by the containing template.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(54073887717731330)
,p_plugin_attribute_id=>wwv_flow_imp.id(54073476089731330)
,p_display_sequence=>10
,p_display_value=>'Small'
,p_return_value=>'t-Badge--sm'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(54074339241731330)
,p_plugin_attribute_id=>wwv_flow_imp.id(54073476089731330)
,p_display_sequence=>20
,p_display_value=>'Medium'
,p_return_value=>'t-Badge--md'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(54074853331731330)
,p_plugin_attribute_id=>wwv_flow_imp.id(54073476089731330)
,p_display_sequence=>30
,p_display_value=>'Large'
,p_return_value=>'t-Badge--lg'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(54272550636101374)
,p_plugin_id=>wwv_flow_imp.id(54067920342731313)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>41
,p_static_id=>'ICON_POSITION'
,p_prompt=>'Icon Position'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_default_value=>'L'
,p_escape_mode=>'HTML'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(54069351140731328)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'NOT_NULL'
,p_lov_type=>'STATIC'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(54272873931102031)
,p_plugin_attribute_id=>wwv_flow_imp.id(54272550636101374)
,p_display_sequence=>10
,p_display_value=>'Left'
,p_return_value=>'L'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(54273238125103486)
,p_plugin_attribute_id=>wwv_flow_imp.id(54272550636101374)
,p_display_sequence=>20
,p_display_value=>'Right'
,p_return_value=>'R'
);
wwv_flow_imp_shared.create_plugin_act_position(
 p_id=>wwv_flow_imp.id(6422761198192217)
,p_plugin_id=>wwv_flow_imp.id(54067920342731313)
,p_name=>'LINK'
,p_static_id=>'LINK'
,p_display_sequence=>10
,p_type=>'LINK'
);
end;
/
prompt --application/end_environment
begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
