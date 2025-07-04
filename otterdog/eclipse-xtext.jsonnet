local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('modeling.tmf.xtext', 'eclipse-xtext') {
  settings+: {
    description: "",
    name: "Eclipse Xtext project",
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  webhooks+: [
    orgs.newOrgWebhook('https://ci.eclipse.org/xtext/github-webhook/') {
      content_type: "json",
      events+: [
        "pull_request",
        "push"
      ],
    },
  ],
  _repositories+:: [
    orgs.newRepo('xtext') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "actions",
        "javascript-typescript",
      ],
      code_scanning_default_setup_enabled: true,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Eclipse Xtext™ is a language development framework ",
      has_discussions: true,
      homepage: "http://www.eclipse.org/Xtext",
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://xtext-builds.itemis.de/jenkins/ghprbhook/') {
          events+: [
            "issue_comment",
            "pull_request",
            "pull_request_review_comment"
          ],
        },
        orgs.newRepoWebhook('https://xtext-builds.itemis.de/jenkins/github-webhook/') {
          events+: [
            "push"
          ],
        },
        orgs.newRepoWebhook('https://hooks.slack.com/services/T0KEWVAQN/B0KEY7U2W/*') {
          content_type: "json",
          events+: [
            "*"
          ],
        },
        orgs.newRepoWebhook('https://ci.eclipse.org/xtext/github-webhook/') {
          content_type: "json",
          events+: [
            "pull_request",
            "push"
          ],
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: null,
          requires_pull_request: false,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('xtext-archive') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      web_commit_signoff_required: false,
    },
    orgs.newRepo('xtext-website') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "javascript-typescript",
        "ruby",
      ],
      code_scanning_default_setup_enabled: true,
      delete_branch_on_merge: false,
      web_commit_signoff_required: false,
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: null,
          requires_pull_request: false,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('published') {
          required_approving_review_count: null,
          requires_pull_request: false,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('xtext-website-publish') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "javascript-typescript",
      ],
      code_scanning_default_setup_enabled: true,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "xtext-website-publish",
      web_commit_signoff_required: false,
    },
  ],
} + {
  # snippet added due to 'https://github.com/EclipseFdn/otterdog-configs/blob/main/blueprints/add-dot-github-repo.yml'
  _repositories+:: [
    orgs.newRepo('.github')
  ],
}
