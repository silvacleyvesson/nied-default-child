{**
 * templates/frontend/pages/indexJournal.tpl
 *
 * Copyright (c) 2014-2018 Simon Fraser University
 * Copyright (c) 2003-2018 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the index page for a journal
 *
 * @uses $currentJournal Journal This journal
 * @uses $journalDescription string Journal description from HTML text editor
 * @uses $homepageImage object Image to be displayed on the homepage
 * @uses $additionalHomeContent string Arbitrary input from HTML text editor
 * @uses $announcements array List of announcements
 * @uses $numAnnouncementsHomepage int Number of announcements to display on the
 *       homepage
 * @uses $issue Issue Current issue
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$currentJournal->getLocalizedName()}

<div class="page_index_journal">

	{call_hook name="Templates::Index::journal"}

	{if $homepageImage}
		<div class="homepage_image">
			<img src="{$publicFilesDir}/{$homepageImage.uploadName|escape:"url"}" alt="{$homepageImageAltText|escape}">
		</div>
	{/if}

{*    {if empty($isFullWidth)}*}
{*        {call_hook|assign:"sidebarCode" name="Templates::Common::Sidebar"}*}
{*        {if $sidebarCode}*}
{*            <div class="pkp_structure_sidebar left" role="complementary" aria-label="{translate|escape key="common.navigation.sidebar"}">*}
{*                {$sidebarCode}*}
{*            </div><!-- pkp_sidebar.left -->*}
{*        {/if}*}
{*    {/if}*}

    {* Announcements Carousel *}
    {include file="frontend/components/carousel.tpl"}

	<div class="row page_index_row">

		<div class="col-12 col-md-12 col-lg-4 mb-4">
			{* Latest issue *}
			{if $issue}
                <h2 class="about_section_title">{translate key="journal.currentIssue"}</h2>
				<div class="current_issue" style="margin-top: 0px;">
					<div class="current_issue_title">
						{$issue->getIssueIdentification()|strip_unsafe_html}
					</div>
					{include file="frontend/objects/issue_toc.tpl"}
					<a href="{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive"}" class="read_more">
						{translate key="journal.viewAllIssues"}
					</a>
				</div>
			{/if}
		</div>

		<div class="col-12 col-md-12 col-lg-4 mb-4">
			{* Additional Homepage Content *}
			{if $journalDescription}
				<div class="additional_content mb-4">
					{$journalDescription}
				</div>
			{/if}
		</div>

        <div class="col-12 col-md-12 col-lg-4 mb-4">
            {* Editorial Team *}
            <h2 class="about_section_title">{translate key="manager.setup.editorialTeam"}</h2>
            <div class="editorial_team mb-4">
                {$currentContext->getLocalizedSetting('editorialTeam')}
            </div>
        </div>
	</div>

</div><!-- .page -->

{include file="frontend/components/footer.tpl"}
