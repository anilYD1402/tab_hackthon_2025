const axios = require('axios');
const fs = require('fs');

const token = process.env.GITHUB_TOKEN;
const [owner, repo] = process.env.GITHUB_REPOSITORY.split('/');
const prNumber = process.env.GITHUB_REF.split('/').pop();

(async () => {
  const prResponse = await axios.post(
    'https://api.githubcopilot.com/mcp/callTool',
    {
      server: 'github',
      tool: 'getPullRequest',
      parameters: { owner, repo, pull_number: prNumber },
    },
    { headers: { Authorization: `Bearer ${token}` } }
  );

  const commitsResponse = await axios.post(
    'https://api.githubcopilot.com/mcp/callTool',
    {
      server: 'github',
      tool: 'listPullRequestCommits',
      parameters: { owner, repo, pull_number: prNumber },
    },
    { headers: { Authorization: `Bearer ${token}` } }
  );

  const combinedData = {
    pr: prResponse.data,
    commits: commitsResponse.data
  };

  fs.writeFileSync('pr-data.json', JSON.stringify(combinedData, null, 2));
})();
