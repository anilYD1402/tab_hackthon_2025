const fs = require('fs');
const axios = require('axios');

const GEMINI_API_KEY = process.env.GEMINI_API_KEY;

(async () => {
  const prData = JSON.parse(fs.readFileSync('pr-data.json', 'utf-8'));

  const prompt = `
Generate a concise summary of this Pull Request with historical context:
- PR Title: ${prData.pr.title}
- Description: ${prData.pr.body}
- Commits: ${prData.commits.map(c => c.commit.message).join('\n')}
- Changed files: ${prData.pr.changed_files}
Include why these changes were made and reference related past changes if possible.
`;

  const response = await axios.post(
    'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent',
    { contents: [{ parts: [{ text: prompt }] }] },
    { headers: { 'Content-Type': 'application/json', 'x-goog-api-key': GEMINI_API_KEY } }
  );

  const summary = response.data.candidates[0].content.parts[0].text;

  fs.writeFileSync('summary.md', summary);
})();
