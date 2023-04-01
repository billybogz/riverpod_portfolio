.PHONY: version clean format lint pubs models rebuild quality

version:
	use 3.3.5

clean: ## Cleans your flutter project's workspace
	flutter clean

format: ## Formats my codebase
	flutter format lib/ test/ --line-length=100

lint: ## Lints the codebase
	flutter analyze

pubs: ## Installs the pubs
	flutter pub get

build_runner: ## Generates files using build runner
	flutter pub run build_runner build --delete-conflicting-outputs

run_ios_emulator: ##Run IOS emulator
	flutter emulators --launch apple_ios_simulator

i18n:  ## Generate i18n
	dart plugins/i18n_generator/lib/main.dart --output lib/generated/i18n_lookup.generated.dart

rebuild: pubs i18n models format 

quality: format lint

fix:
	dart fix --apply