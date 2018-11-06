{**
 * templates/frontend/components/footer.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Common site frontend footer.
 *
 * @uses $isFullWidth bool Should this page be displayed without sidebars? This
 *       represents a page-level override, and doesn't indicate whether or not
 *       sidebars have been configured for thesite.
 *}

	</div><!-- pkp_structure_main -->

	{* Sidebars *}
	{if empty($isFullWidth)}
		{call_hook|assign:"sidebarCode" name="Templates::Common::Sidebar"}
		{if $sidebarCode}
			<div class="pkp_structure_sidebar left" role="complementary" aria-label="{translate|escape key="common.navigation.sidebar"}">
				{* Agregando los botones Número actual, Números anteriores y Avance en línea*}
				<div class="pkp_block">
					<div id="numero_actual" class="botones_derecha">
						<a href="{url router=$smarty.const.ROUTE_PAGE page="issue" op="current"}">
							{translate key="plugins.themes.default-child.navigation.current"}
						</a>
					</div>
					<div id="numeros_anteriores" class="botones_derecha">
						<a href="{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive"}">
							{translate key="plugins.themes.default-child.navigation.archives"}
						</a>
					</div>
					<div id="avance_linea" class="botones_derecha">
						<a href="{url router=$smarty.const.ROUTE_PAGE page="forthcoming" op="view"}">{translate key="plugins.themes.default-child.navigation.advance.online"}</a>
					</div>
				</div>
				{* Contenido que sólo se muestra estando en la vista article *}
				{if $requestedPage == 'article'}
				<div class="obj_article_details">
					<div class="entry_details">

						{* Article Galleys *}
						{if $primaryGalleys}
							<div class="item galleys">
								<ul class="value galleys_links">
									{foreach from=$primaryGalleys item=galley}
										<li>
											{include file="frontend/objects/galley_link.tpl" parent=$article galley=$galley purchaseFee=$currentJournal->getSetting('purchaseArticleFee') purchaseCurrency=$currentJournal->getSetting('currency')}
										</li>
									{/foreach}
								</ul>
							</div>
						{/if}

						{if $supplementaryGalleys}
							<div class="item galleys">
								<ul class="value supplementary_galleys_links">
									{foreach from=$supplementaryGalleys item=galley}
										<li>
											{include file="frontend/objects/galley_link.tpl" parent=$article galley=$galley isSupplementary="1"}
										</li>
									{/foreach}
								</ul>
							</div>
						{/if}

						{if $article->getDatePublished()}
							<div class="item published">
								<div class="label">
									{translate key="submissions.published"}
								</div>
								<div class="value">
									{$article->getDatePublished()|date_format:$dateFormatShort}
								</div>
							</div>
						{/if}
						
						{* How to cite *}
						{if $citation}
							<div class="item citation">
								<div class="sub_item citation_display">
									<div class="label">
										{translate key="submission.howToCite"}
									</div>
									<div class="value">
										<div id="citationOutput" role="region" aria-live="polite">
											{$citation}
										</div>
										<div class="citation_formats">
											<button class="cmp_button citation_formats_button" aria-controls="cslCitationFormats" aria-expanded="false" data-csl-dropdown="true">
												{translate key="submission.howToCite.citationFormats"}
											</button>
											<div id="cslCitationFormats" class="citation_formats_list" aria-hidden="true">
												<ul class="citation_formats_styles">
													{foreach from=$citationStyles item="citationStyle"}
														<li>
															<a
																aria-controls="citationOutput"
																href="{url page="citationstylelanguage" op="get" path=$citationStyle.id params=$citationArgs}"
																data-load-citation
																data-json-href="{url page="citationstylelanguage" op="get" path=$citationStyle.id params=$citationArgsJson}"
															>
																{$citationStyle.title|escape}
															</a>
														</li>
													{/foreach}
												</ul>
												{if count($citationDownloads)}
													<div class="label">
														{translate key="submission.howToCite.downloadCitation"}
													</div>
													<ul class="citation_formats_styles">
														{foreach from=$citationDownloads item="citationDownload"}
															<li>
																<a href="{url page="citationstylelanguage" op="download" path=$citationDownload.id params=$citationArgs}">
																	<span class="fa fa-download"></span>
																	{$citationDownload.title|escape}
																</a>
															</li>
														{/foreach}
													</ul>
												{/if}
											</div>
										</div>
									</div>
								</div>
							</div>
						{/if}

						{* Licensing info *}
						{if $copyright || $licenseUrl}
							<div class="item copyright">
								{if $licenseUrl}
									{if $ccLicenseBadge}
										{$ccLicenseBadge}
									{else}
										<a href="{$licenseUrl|escape}" class="copyright">
											{if $copyrightHolder}
												{translate key="submission.copyrightStatement" copyrightHolder=$copyrightHolder copyrightYear=$copyrightYear}
											{else}
												{translate key="submission.license"}
											{/if}
										</a>
									{/if}
								{/if}
								{$copyright}
							</div>
						{/if}	
					</div>
				</div>
				{/if}
				{$sidebarCode}
			</div><!-- pkp_sidebar.left -->
		{/if}
	{/if}
</div><!-- pkp_structure_content -->

<div id="pkp_content_footer" class="pkp_structure_footer_wrapper" role="contentinfo">

	<div class="pkp_structure_footer">

		{if $pageFooter}
			<div class="pkp_footer_content">
				{$pageFooter}
			</div>
		{/if}

		<div class="pkp_brand_footer" role="complementary">
			<a href="{url page="about" op="aboutThisPublishingSystem"}">
				<img alt="{translate key="about.aboutThisPublishingSystem"}" src="{$baseUrl}/{$brandImage}">
			</a>
		</div>
	</div>
</div><!-- pkp_structure_footer_wrapper -->

</div><!-- pkp_structure_page -->

{load_script context="frontend"}

{call_hook name="Templates::Common::Footer::PageFooter"}
</body>
</html>
