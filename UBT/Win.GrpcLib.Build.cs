// Copyright (c) 2024, Mohamad Shaaban, https://github.com/sha3sha3/UE-GRPC.
using UnrealBuildTool;
using System;
using System.IO;

	public class GrpcLib : ModuleRules
	{
		public GrpcLib(ReadOnlyTargetRules Target) : base(Target)
		{
			Type = ModuleType.External;
		    CppStandard = CppStandardVersion.Cpp17;
		    PublicSystemIncludePaths.Add(Path.Combine(ModuleDirectory, "include"));
		    bEnableUndefinedIdentifierWarnings = false;

		string LibPath = Path.Combine(ModuleDirectory, "lib");
		string DynamicLibPath = Path.Combine(ModuleDirectory, "bin");
		if (Target.Platform == UnrealTargetPlatform.Win64)
		{
			string LibPathWin = Path.Combine(LibPath, "Win64");

			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_bad_any_cast_impl.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_bad_optional_access.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_bad_variant_access.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_base.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_city.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_civil_time.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_cord.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_cordz_functions.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_cordz_handle.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_cordz_info.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_cordz_sample_token.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_cord_internal.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_debugging_internal.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_demangle_internal.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_examine_stack.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_exponential_biased.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_failure_signal_handler.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_flags.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_flags_commandlineflag.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_flags_commandlineflag_internal.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_flags_config.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_flags_internal.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_flags_marshalling.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_flags_parse.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_flags_private_handle_accessor.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_flags_program_name.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_flags_reflection.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_flags_usage.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_flags_usage_internal.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_graphcycles_internal.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_hash.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_hashtablez_sampler.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_int128.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_leak_check.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_log_severity.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_low_level_hash.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_malloc_internal.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_periodic_sampler.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_random_distributions.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_random_internal_distribution_test_util.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_random_internal_platform.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_random_internal_pool_urbg.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_random_internal_randen.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_random_internal_randen_hwaes.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_random_internal_randen_hwaes_impl.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_random_internal_randen_slow.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_random_internal_seed_material.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_random_seed_gen_exception.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_random_seed_sequences.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_raw_hash_set.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_raw_logging_internal.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_scoped_set_env.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_spinlock_wait.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_stacktrace.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_status.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_statusor.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_strerror.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_strings.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_strings_internal.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_str_format_internal.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_symbolize.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_synchronization.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_throw_delegate.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_time.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "absl_time_zone.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "address_sorting.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "cares.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "gpr.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "grpc++.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "grpc++_alts.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "grpc++_error_details.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "grpc++_reflection.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "grpc++_unsecure.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "grpc.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "grpcpp_channelz.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "grpc_plugin_support.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "grpc_unsecure.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "libprotobuf-lite.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "libprotobuf.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "libprotoc.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "re2.lib"));
			PublicAdditionalLibraries.Add(Path.Combine(LibPathWin, "upb.lib"));

		}
		
		PrivateDependencyModuleNames.AddRange(
			new string[]
			{
				"Core",
				"zlib",
				"OpenSSL"
				
			}
			);

	}

	}
