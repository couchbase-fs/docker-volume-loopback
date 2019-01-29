# Performance
https://serverfault.com/questions/166748/performance-of-loopback-filesystems
https://kernelnewbies.org/Linux_4.4#Faster_and_leaner_loop_device_with_Direct_I.2FO_and_Asynchronous_I.2FO_support

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=bc07c10a3603a5ab3ef01ba42b3d41f9ac63d1b6

```
chown -1:-1

```

### Sparse

|FS   | Sparse        | Regular    |
| --- | ------------- | ---------- |
|xfs  | 0%/1%         | 100%/100%  |
|ext4 | 0%/3%         | 100%/3%    |


## Development
Go 1.11
```bash
go mod vendor
go mod tidy
```

## Test
ext4/xfs - sparse/regular
on ext4/xfs vs ext3
not enough space
