import Foundation

struct Task {
    var title: String
    var isCompleted: Bool
}

class ToDoList {
    private var tasks: [Task] = []
    
    func tampilkanMenu() {
        print("=== To-Do List ===")
        print("1. Tambah Tugas")
        print("2. Lihat Tugas")
        print("3. Hapus Tugas")
        print("4. Tandai Tugas Selesai")
        print("5. Keluar")
        print("==================")
    }
    
    func tambahTugas() {
        print("Masukkan judul tugas: ", terminator: "")
        if let title = readLine(), !title.isEmpty {
            let task = Task(title: title, isCompleted: false)
            tasks.append(task)
            print("Tugas berhasil ditambahkan.")
        } else {
            print("Judul tugas tidak boleh kosong.")
        }
    }
    
    func lihatTugas() {
        if tasks.isEmpty {
            print("Tidak ada tugas.")
        } else {
            print("\n=== Daftar Tugas ===")
            for (index, task) in tasks.enumerated() {
                let status = task.isCompleted ? "[✓]" : "[ ]"
                print("\(index + 1). \(status) \(task.title)")
            }
            print("====================\n")
        }
    }
    
    func hapusTugas() {
        lihatTugas()
        print("Masukkan nomor tugas yang ingin dihapus: ", terminator: "")
        if let input = readLine(), let index = Int(input), index > 0 && index <= tasks.count {
            tasks.remove(at: index - 1)
            print("Tugas berhasil dihapus.")
        } else {
            print("Nomor tugas tidak valid.")
        }
    }
    
    func tandaiTugasSelesai() {
        lihatTugas()
        print("Masukkan nomor tugas yang ingin ditandai selesai: ", terminator: "")
        if let input = readLine(), let index = Int(input), index > 0 && index <= tasks.count {
            tasks[index - 1].isCompleted = true
            print("Tugas berhasil ditandai selesai.")
        } else {
            print("Nomor tugas tidak valid.")
        }
    }
    
    func jalankan() {
        var running = true
        
        while running {
            tampilkanMenu()
            print("Pilih opsi: ", terminator: "")
            
            if let pilihan = readLine(), let opsi = Int(pilihan) {
                switch opsi {
                case 1:
                    tambahTugas()
                case 2:
                    lihatTugas()
                case 3:
                    hapusTugas()
                case 4:
                    tandaiTugasSelesai()
                case 5:
                    print("Terima kasih telah menggunakan To-Do List!")
                    running = false
                default:
                    print("Opsi tidak valid,Coba lagi.")
                }
            } else {
                print("Input tidak valid,Coba lagi.")
            }
            
            print("\n")
        }
    }
}

let toDoList = ToDoList()
toDoList.jalankan()
