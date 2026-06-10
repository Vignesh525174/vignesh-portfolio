# Portfolio

This repository contains a personal portfolio site for Vignesh R.

To deploy to GitHub Pages:

1. Create a new repository on GitHub.
2. Add the remote and push:

```
git remote add origin git@github.com:USERNAME/REPO.git
git push -u origin main
git push -u origin gh-pages
```

Alternatively, enable GitHub Pages from the repository settings and select the `gh-pages` branch or `main` branch.

Automation scripts:

- PowerShell (Windows): `deploy.ps1`
	- Usage:
		```powershell
		.\deploy.ps1 -RemoteUrl "https://github.com/USERNAME/REPO.git"
		```
	- If you omit `-RemoteUrl`, the script will prompt you.

- Bash (macOS / Linux / WSL): `deploy.sh`
	- Usage:
		```bash
		./deploy.sh "git@github.com:USERNAME/REPO.git"
		```

Both scripts add or update the `origin` remote and push `main` and `gh-pages` branches. After pushing, enable GitHub Pages in the repository settings and choose the `gh-pages` branch (or `main`) as the source.