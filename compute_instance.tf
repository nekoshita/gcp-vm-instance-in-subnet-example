resource "google_compute_instance" "bastion" {
  name         = "bastion"
  machine_type = "f1-micro"
  zone         = var.gcp_zones["tokyo-a"]

  # Firewallでタグごとにルールを設定したいので、VMインスタンスにタグを設定しておく
  tags = ["bastion-tag"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    # 自分で定義したsubnetworkにインスタンスを起動する
    network    = google_compute_network.my_network.name
    subnetwork = google_compute_subnetwork.my_subnetwork.name
    # 外部IPアドレスを割り振る方法は次の2種類ある。静的外部IPアドレス、エフェメラル外部IPアドレス
    # 今回はエフェメラル外部IPアドレスを使うので、access_configの中は何も指定しない
    access_config {}
  }

  service_account {
    # https://cloud.google.com/compute/docs/access/service-accounts#accesscopesiam
    # インスタンスで完全な cloud-platform アクセス スコープを設定すると、すべての Google Cloud リソースに対する完全アクセス権を付与できる
    # その後、IAM ロールを使用してサービス アカウントの API アクセス権を安全に制限することをGoogleは推奨している
    email  = google_service_account.my_service_account_for_bastion.email
    scopes = ["cloud-platform"]
  }

  scheduling {
    # 料金を抑えるためにプリエンプティブルにしておく
    preemptible = true
    # プリエンプティブルの場合は下のオプションが必須
    automatic_restart = false
  }
}

