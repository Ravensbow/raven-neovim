return {
	"seblyng/roslyn.nvim",
	ft = { "cs", "csproj", "razor" },
	opts = {
		config = {
			settings = {
				["csharp|background_analysis"] = {
					dotnet_analyzer_diagnostics_scope = "fullSolution",
					dotnet_compiler_diagnostics_scope = "fullSolution",
				},
				["csharp|inlay_hints"] = {
					-- csharp_enable_inlay_hints_for_types = true,
					csharp_enable_inlay_hints_for_lambda_parameter_types = true,
					dotnet_enable_inlay_hints_for_indexer_parameters = true,
					dotnet_enable_inlay_hints_for_literal_parameters = true,
					dotnet_enable_inlay_hints_for_object_creation_parameters = true,
					dotnet_enable_inlay_hints_for_other_parameters = true,
					dotnet_enable_inlay_hints_for_parameters = true,
				},
				["csharp|code_lens"] = {
					dotnet_enable_references_code_lens = true,
					dotnet_enable_tests_code_lens = true,
				},
			},
		},
		filewatching = true,
	}
}
