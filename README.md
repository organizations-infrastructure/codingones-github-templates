# codingones-github-templates Organization Infrastructure

## About
This repository describe through IAC the codingones-github-templates administrative infrastructure in Github.

## TOC

- 🪧 [About](#about)
- 🛠️ [Usage](#usage)
- 🤝 [Contribution](#contribution)
- 🏗️ [Built With](#built-with)
- 📝 [License](#license)


## Usage

### Generating the infrastructure templates.
- Add repositories in repositories.tf

- Run the ['Apply the changes to codingones-github-templates' workflow](https://github.com/organizations-infrastructure/codingones-github-templates/actions) (time <~ 3 min)
  - The infrastructure template repositories have been generated / updated in the [codingones-github-templates github organization](https://github.com/codingones-github-templates).

# Développement avec Terraform

## Installation

La commande suivante permet d'utiliser la ligne de commande terraform via Docker :
```shell
docker run --rm -it --name terraform -v ~/:/root/ -v $(pwd):/workspace -w /workspace hashicorp/terraform:light
```

Pour une utilisation simplifiée, il est possible de créer un alias :
```shell
alias terraform='docker run --rm -it --name terraform -v ~/:/root/ -v $(pwd):/workspace -w /workspace hashicorp/terraform:light'
```

Avec cet alias, il n'y a plus de différence entre une commande terraform exécutée avec Docker ou avec Terraform CLI.

## Utilisation

### Vérifier et corriger la syntaxe des fichiers `.tf`

```shell
terraform fmt
```

### Vérifier la cohérence de l'infrastructure

```shell
terraform validate
```

### Récupérer un jeton d'authentification à Terraform Cloud en local

```shell
terraform login
```

### Initialiser l'état et les plugins en local

```shell
terraform init
```

### Planifier une exécution pour voir les différences avec l'état précédent de l'infrastructure

```shell
terraform plan
```

## Contribution

### Appliquer la mise à jour de l'infrastructure

Pour que les modifications de la description de l'infrastructure soient appliquées en production, il suffit de publier les changements sur la branche `main`.

## Construit avec

### Langages & Frameworks

- [Terraform](https://www.terraform.io/) est un outil de description d'infrastructure par le code qui permet de créer et de maintenir une infrastructure de manière sûre et prévisible

### Outils

#### CI

- [Github Actions](https://docs.github.com/en/actions) est l'outil d'intégration et de déploiement continu intégré à GitHub
- Secrets du dépôt :
    - `TF_API_TOKEN` : Le token d'api Terraform Cloud qui permet à la CI d'opérer des actions sur Terraform Cloud

#### Déploiement

- [Terraform Cloud](https://app.terraform.io/) est la plateforme proposée par HashiCorp pour administrer les modifications d'infrastructure
    - Organization : [codingones-github-templates](https://app.terraform.io/app/codingones-github-templates/workspaces)

## Licence

Voir le fichier [LICENSE.md](./LICENSE.md) du dépôt.