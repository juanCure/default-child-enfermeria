{**
 * lib/pkp/templates/frontend/components/header.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Common frontend site header.
 *
 * @uses $isFullWidth bool Should this page be displayed without sidebars? This
 *       represents a page-level override, and doesn't indicate whether or not
 *       sidebars have been configured for thesite.
 *}
{strip}
	{* Determine whether a logo or title string is being displayed *}
	{assign var="showingLogo" value=true}
	{if $displayPageHeaderTitle && !$displayPageHeaderLogo && is_string($displayPageHeaderTitle)}
		{assign var="showingLogo" value=false}
	{/if}
{/strip}
<!DOCTYPE html>
<html lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
{if !$pageTitleTranslated}{translate|assign:"pageTitleTranslated" key=$pageTitle}{/if}
{include file="frontend/components/headerHead.tpl"}
<body class="pkp_page_{$requestedPage|escape|default:"index"} pkp_op_{$requestedOp|escape|default:"index"}{if $showingLogo} has_site_logo{/if}" dir="{$currentLocaleLangDir|escape|default:"ltr"}">
  <div class="_pattern-overlay"></div>

	<div class="cmp_skip_to_content">
		<a href="#pkp_content_main">{translate key="navigation.skip.main"}</a>
		<a href="#pkp_content_nav">{translate key="navigation.skip.nav"}</a>
		<a href="#pkp_content_footer">{translate key="navigation.skip.footer"}</a>
	</div>
	<div class="pkp_structure_page">

		{* Header *}
		<header class="pkp_structure_head" id="headerNavigationContainer" role="banner">
		<div id="video_container">
			<video autoplay muted loop id="myVideo">
				<source src="{$baseUrl}/plugins/themes/default-child/video/video.mp4" type="video/mp4">
			</video>
		</div>
			<div class="pkp_head_wrapper">

				<div id="headerElements" class="pkp_site_name_wrapper">
					<h1>Enfermería</h1>
          <h2>Universitaria</h2>
          <img id="unam" src="{$baseUrl}/plugins/themes/default-child/images/unam.png" alt="">
          <img id="eneo" src="{$baseUrl}/plugins/themes/default-child/images/eneo.png" alt="">
				</div><!-- .pkp_site_name_wrapper-->

				{* Primary site navigation *}
				{if $currentContext}
					<nav class="pkp_navigation_primary_row" aria-label="{translate|escape key="common.navigation.site"}">
						<div class="pkp_navigation_primary_wrapper">
							{* Primary navigation menu for current application *}
							{load_menu name="primary" id="navigationPrimary" ulClass="pkp_navigation_primary"}

							{* Search form *}
							{include file="frontend/components/searchForm_simple.tpl"}
						</div>
					</nav>
				{/if}
				<nav class="pkp_navigation_user_wrapper" id="navigationUserWrapper" aria-label="{translate|escape key="common.navigation.user"}">
					{load_menu name="user" id="navigationUser" ulClass="pkp_navigation_user" liClass="profile"}
				</nav>
				<div id="layoutdims">
					<span id="publicacion">Publicación de la Escuela Nacional de Enfermería y Obstetricia de la UNAM</span>
         	<div id="lang">
            <a class="lang" id="lang_es" href="#"><img src="{$baseUrl}/plugins/themes/default-child/images/lang_es.png" alt=""></a><a class="lang" id="lang_en" href="#"><img src="{$baseUrl}/plugins/themes/default-child/images/lang_en.png" alt=""></a>
         	</div>
         	<span id="isbn"> ISSN 2395-8421</span>
        </div>
			</div><!-- .pkp_head_wrapper -->
		</header><!-- .pkp_structure_head -->

		{* Wrapper for page content and sidebars *}
		{if $isFullWidth}
			{assign var=hasSidebar value=0}
		{/if}
		<div class="pkp_structure_content{if $hasSidebar} has_sidebar{/if}">
			<div id="sidebar_right">
				<!-- Column 2 start -->
        <h3>{translate key="plugins.themes.default-child.content.mainmenu"}</h3>
        <ul>
           <li><a href="{$baseUrl}/index.php/enfermeriauniversitaria/objetivoyalcance">{translate key="plugins.themes.default-child.sidebar.left.objetive"}</a></li>
           <li><a href="{$baseUrl}/index.php/enfermeriauniversitaria/politicas">{translate key="plugins.themes.default-child.sidebar.left.politics"}</a></li>
           <li><a href="{$baseUrl}/index.php/enfermeriauniversitaria/envios">{translate key="plugins.themes.default-child.sidebar.left.rules"}</a></li>
           <li><a href="{$baseUrl}/index.php/enfermeriauniversitaria/materialautores">{translate key="plugins.themes.default-child.sidebar.left.material"}</a></li>
           <li><a href="{$baseUrl}/index.php/enfermeriauniversitaria/guiasevaluacion">{translate key="plugins.themes.default-child.sidebar.left.guides"}</a></li>
           <li><a href="{$baseUrl}/index.php/enfermeriauniversitaria/secciones">{translate key="plugins.themes.default-child.sidebar.left.sections"}</a></li>
           <li><a href="{$baseUrl}/index.php/enfermeriauniversitaria/about/submissions">{translate key="plugins.themes.default-child.sidebar.left.sending"}</a></li>
           <li><a href="{$baseUrl}/index.php/enfermeriauniversitaria/codigoetica">{translate key="plugins.themes.default-child.sidebar.left.ethic"}</a></li>
        </ul>
        <img id="cc" src="{$baseUrl}/plugins/themes/default-child/images/cc.jpg" alt="">
        <h3>{translate key="plugins.themes.default-child.content.index"}</h3>
        <div id="content_indexada">
        	<a href="#" class="indexadores"></a>
        	<a href="#" class="indexadores"></a>
        	<a href="#" class="indexadores"></a>
        	<a href="#" class="indexadores"></a>
        	<a href="#" class="indexadores"></a>
        	<a href="#" class="indexadores"></a>
        	<a href="#" class="indexadores"></a>
        	<a href="#" class="indexadores"></a>
        	<a href="#" class="indexadores"></a>
        	<a href="#" class="indexadores"></a>
        </div>
        <!-- Column 2 end -->
			</div>
			<div id="pkp_content_main" class="pkp_structure_main" role="main">
