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

			PrivateDependencyModuleNames.AddRange(
		  	new string[]
		  	{
				"OpenSSL",
				"zlib"

		  	});

		}
		else if (Target.Platform == UnrealTargetPlatform.Linux)
        {
			string LibLinux64 = Path.Combine(LibPath, "Linux64");
			string DynamicLibLinux64 = Path.Combine(DynamicLibPath, "Linux64");
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_bad_any_cast_impl.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_bad_optional_access.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_bad_variant_access.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_base.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_city.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_civil_time.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_cord.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_cordz_functions.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_cordz_handle.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_cordz_info.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_cordz_sample_token.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_cord_internal.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_debugging_internal.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_demangle_internal.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_examine_stack.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_exponential_biased.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_failure_signal_handler.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_flags.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_flags_commandlineflag.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_flags_commandlineflag_internal.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_flags_config.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_flags_internal.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_flags_marshalling.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_flags_parse.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_flags_private_handle_accessor.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_flags_program_name.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_flags_reflection.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_flags_usage.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_flags_usage_internal.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_graphcycles_internal.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_hash.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_hashtablez_sampler.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_int128.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_leak_check.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_log_severity.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_low_level_hash.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_malloc_internal.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_periodic_sampler.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_random_distributions.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_random_internal_distribution_test_util.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_random_internal_platform.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_random_internal_pool_urbg.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_random_internal_randen.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_random_internal_randen_hwaes.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_random_internal_randen_hwaes_impl.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_random_internal_randen_slow.a"));
			PublicAdditionalLibraries.Add(Path.Combine(DynamicLibLinux64, "libabsl_random_internal_seed_material.so"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_random_seed_gen_exception.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_random_seed_sequences.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_raw_hash_set.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_raw_logging_internal.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_scoped_set_env.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_spinlock_wait.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_stacktrace.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_status.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_statusor.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_strerror.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_strings.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_strings_internal.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_str_format_internal.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_symbolize.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_synchronization.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_throw_delegate.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_time.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libabsl_time_zone.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libaddress_sorting.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libgpr.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libgrpc++.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libgrpc++_alts.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libgrpc++_error_details.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libgrpc++_reflection.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libgrpc++_unsecure.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libgrpc.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libgrpcpp_channelz.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libgrpc_plugin_support.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libgrpc_unsecure.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libprotobuf-lite.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libprotobuf.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libprotoc.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libre2.a"));
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libupb.a")); 
			PublicAdditionalLibraries.Add(Path.Combine(LibLinux64, "libcares.a"));

			RuntimeDependencies.Add("$(TargetOutputDir)/libabsl_random_internal_seed_material.so.2206.0.0", Path.Combine(DynamicLibPath, "Linux64/libabsl_random_internal_seed_material.so"));
			PrivateDependencyModuleNames.AddRange(
		  new string[]
		  {
				"OpenSSL",
				"zlib"

		  }
		  );

		}
		
#if UE_5_0_OR_LATER
		else if(Target.Platform == UnrealTargetPlatform.LinuxArm64)
#else
		else if (Target.Platform == UnrealTargetPlatform.LinuxAArch64)
#endif

		{
#if UE_5_0_OR_LATER
			string PluginBuildPath="$(PluginDir)/Binaries/LinuxArm64";
#else
			string PluginBuildPath = "$(PluginDir)/Binaries/LinuxAArch64";
#endif
            string LibLinuxArm64 = Path.Combine(LibPath, "Arm64");
            string DynamicLibLinuxArm64 = Path.Combine(DynamicLibPath, "Arm64");
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_bad_any_cast_impl.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_bad_optional_access.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_bad_variant_access.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_base.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_city.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_civil_time.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_cord.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_cordz_functions.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_cordz_handle.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_cordz_info.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_cordz_sample_token.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_cord_internal.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_debugging_internal.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_demangle_internal.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_examine_stack.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_exponential_biased.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_failure_signal_handler.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_flags.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_flags_commandlineflag.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_flags_commandlineflag_internal.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_flags_config.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_flags_internal.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_flags_marshalling.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_flags_parse.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_flags_private_handle_accessor.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_flags_program_name.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_flags_reflection.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_flags_usage.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_flags_usage_internal.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_graphcycles_internal.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_hash.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_hashtablez_sampler.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_int128.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_leak_check.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_log_severity.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_low_level_hash.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_malloc_internal.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_periodic_sampler.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_random_distributions.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_random_internal_distribution_test_util.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_random_internal_platform.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_random_internal_pool_urbg.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_random_internal_randen.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_random_internal_randen_hwaes.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_random_internal_randen_hwaes_impl.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_random_internal_randen_slow.a"));
            PublicAdditionalLibraries.Add(Path.Combine(DynamicLibLinuxArm64, "libabsl_random_internal_seed_material.so"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_random_seed_gen_exception.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_random_seed_sequences.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_raw_hash_set.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_raw_logging_internal.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_scoped_set_env.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_spinlock_wait.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_stacktrace.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_status.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_statusor.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_strerror.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_strings.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_strings_internal.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_str_format_internal.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_symbolize.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_synchronization.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_throw_delegate.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_time.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libabsl_time_zone.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libaddress_sorting.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libgpr.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libgrpc++.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libgrpc++_alts.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libgrpc++_error_details.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libgrpc++_reflection.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libgrpc++_unsecure.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libgrpc.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libgrpcpp_channelz.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libgrpc_plugin_support.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libgrpc_unsecure.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libprotobuf-lite.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libprotobuf.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libprotoc.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libre2.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libupb.a"));
            PublicAdditionalLibraries.Add(Path.Combine(LibLinuxArm64, "libcares.a"));

            PrivateDependencyModuleNames.AddRange(
          new string[]
          {
                "OpenSSL",
				"zlib"

          }
          );

        }
		PrivateDependencyModuleNames.AddRange(
			new string[]
			{
				"Core"
				
			}
			);

	}

	}
