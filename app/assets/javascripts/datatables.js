$(function () {
  $(document).ready(function() {
    if ( $.fn.dataTable.isDataTable( '.datatable' ) ) {
      table = $('.datatable').DataTable();
    }
    else {

      table = $('.datatable').DataTable( {
        order: [],
        destroy: true,
        autoWidth: false,
        bInfo: false,
        pagingType: 'full_numbers',
        lengthMenu: [[12, 24, 50, 100, -1], [12, 24, 50, 100, 'All']],
        oLanguage: {
          sEmptyTable: 'There are no entries!',
          sInfoEmpty: 'No data found',
          sZeroRecords: 'No data found!',
          sLoadingRecords: 'Please wait...',
          sLengthMenu: "Show _MENU_ entries",
          sSearch: 'Search keywords: ',
          oPaginate: {
            sFirst: 'First Page',
            sLast: 'Last Page',
            sNext: 'Next',
            sPrevious: 'Previous',
          },
          sInfo: 'Showing _START_ to _END_ (from total _TOTAL_ entries)',
          sInfoFiltered: ' - search in _MAX_ entries.'
        }
      });
    }

    // Focus on search box
    $('div.dataTables_filter input').first().focus();

    $(table.columns()[0]).each(function() {
      var visibility_pos = $(this)[0] + 1;

      var column = table.column($(this));

      if (column.visible() == true ) {
        $('table[id^=visibility] td:nth-child(' + visibility_pos + ')').find('a').addClass('btn-success');
      }
      else {
        $('table#[id^=visibility] td:nth-child(' + visibility_pos + ')').find('a').addClass('btn-danger');
      }
    });

    $('a.toggle-vis').on( 'click', function (e) {
      e.preventDefault();
      // Get the column API object
      var column = table.column( $(this).attr('data-column'));
      // Toggle the visibility
      column.visible( ! column.visible() );

      if (column.visible() == true) {
        $(this).removeClass('btn-danger').addClass('btn-success');
      }
      else {
        $(this).removeClass('btn-success').addClass('btn-danger');
      }
    } );
  });
});
