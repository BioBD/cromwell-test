.PHONY: wdl_versions vep slurm runtime_attributes spark call_caching

wdl_versions vep slurm runtime_attributes spark call_caching:
	@$(MAKE) -C $@